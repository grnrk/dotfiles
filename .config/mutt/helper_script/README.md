# Mutt config

## Calendar

An option to mutt-ics may be <https://waynemorrison.com/software/vcal>

## o365

- mutt_oauth: modify tenant in script!!!
- All endpoints as well!!
- no use common, only tenant!!

- set gpg identity in ENCRYPTION_PIPE (otherwise refresh will fail)
- check diff with original. secret_id key error fixed when using deviceauth

- Note, azure app settings does not match the ones described in mutt_oauth2.py.README

- WE ARE USING localhostauthcode successfully with current settings!

- Source: <https://github.com/neomutt/neomutt/blob/main/contrib/oauth2/>

### Overview

Script obtains a token and a refresh token from application when ran with --authorize,  
and writes application details along with refresh token and authflow settings to \<token-file\>,  
which is encrypted using ENCRYPTION_PIPE (ie gpg).

### Troubleshooting

__Authentication__  
`python3 mutt_oauth2.py gorane@axis.com.tokens --provider microsoft --verbose --test`

### Authentication

__Initial setup__

```bash
python3 mutt_oauth2.py gorane@axis.com.tokens \
   --verbose \
   --authorize \
   --provider microsoft \
   --encryption-pipe "gpg --encrypt --recipient <gorane@axis.com>" \
   --client-id 2a667f1b-0a06-4661-a7a0-909eb22bea9d \
   --client-secret "secret" \
   --authflow localhostauthcode
```

__RE-auth__  

- In theory(?): `python3 mutt_oauth2.py gorane@axis.com.tokens`
- In practice: Same as original auth. because error in script??
  ALLTSÅ:
    Fixa ny secret i https://portal.azure.com (Sök på app registrations)
    rm tokens file i detta dir
    kör initial setup ovan. (--client-secret = Value från den nya secreten. --client-id = samma som innan, INTE det nya "Secret ID")

### Error

This happens when --encryption-pipe is not specified on CLI.  
Fix in script so that ENCRYPTION_PIPE is used when --encryption-pipe is not set, which it wasn't before.  

```text
gorane@lap5cg1384xxq ~> python3 mutt_oauth2.py gorane@axis.com.tokens
Traceback (most recent call last):
  File "/home/gorane/.config/mutt/helper_script/mutt_oauth2.py", line 363, in <module>
    update_tokens(response)
  File "/home/gorane/.config/mutt/helper_script/mutt_oauth2.py", line 186, in update_tokens
    writetokenfile()
  File "/home/gorane/.config/mutt/helper_script/mutt_oauth2.py", line 133, in writetokenfile
    sub2 = subprocess.run(ENCRYPTION_PIPE, check=True, input=json.dumps(token).encode(),
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 548, in run
    with Popen(*popenargs, **kwargs) as process:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/subprocess.py", line 1024, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib/python3.11/subprocess.py", line 1759, in _execute_child
    args = list(args)
           ^^^^^^^^^^
TypeError: 'NoneType' object is not iterable
```
