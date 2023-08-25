#!/usr/bin/env python3

import os
import sys
import ldap3
import argparse
import keyring
import configparser

p = argparse.ArgumentParser(description='A LDAP addressbook search for mutt.',
                            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
p.add_argument('-s', '--searchterm', nargs='*', help='Term to search for.')
p.add_argument('-c', '--configfile', dest='configfile',
               default='~/.ldap-abook.ini',
               help='Configuration file location.')
p.add_argument('--config-template', dest='showtemplate', action='store_true',
                help='Show configuration template.')
args = p.parse_args()

CONF_FILE_TEMPLATE = '''
These are _required_ configuration file settings.
Put this in ~/.ldap-abook.ini (or anywhere specified with -c).
[connection]
ldap_uri = <LDAP-PROTO>://<LDAP-SERVER-FQDN>:<LDAP-PORT>
bind_dn = <BIND-DN>
bind_pass = <BIND-PASSWORD> -- Obsolete: Set keyring
'''

if args.showtemplate:
    print(CONF_FILE_TEMPLATE)
    sys.exit(0)

# Exit if search term arg is missing.
if not args.searchterm:
    print('Missing required argument: -s/--searchterm')
    sys.exit(0)

# Make sure we have a config file
CONF_FILE = os.path.expanduser(args.configfile)
try:
    assert os.path.exists(CONF_FILE), 'Config file "{}" not found.'.format(CONF_FILE)
except AssertionError as e:
    print(e)
    sys.exit(1)

# Get configuration file options
config = configparser.ConfigParser()
config.read(CONF_FILE)


# GLOBAL VARIABLES

try:
    LDAP_URI = config.get('connection', 'ldap_uri')
    BIND_DN = config.get('connection', 'bind_dn')
    # BIND_PASS = config.get('connection', 'bind_pass')
    BIND_PASS = keyring.get_password('outlook', 'personal')  # Same as set in ~/.offlineimaprc
    assert LDAP_URI and BIND_DN and BIND_PASS
except:
    print(('Missing required configuration file option. '
        'Use: `{} --config-template` for more info.'.format(sys.argv[0])))
    sys.exit(1)

SEARCH_BASE = 'ou=axis,dc=axis,dc=com'
SEARCH_TERM = ' '.join(args.searchterm)


# FUNCTIONS

def ldapQ(term):
    # Search all mail attributes where objectClass is "user" or "contact" AND "person" AND any match in fuzzy_search.
    filter_base = '(|(objectClass=user)(objectClass=contact))(objectClass=person)(mail=*)'
    fuzzy_search = '(|(mail={0}*)(mailNickname={0}*)(cn={0}*)(sn={0}*)(givenName={0}*))'.format(term)
    filtr = '(&{0}{1})'.format(filter_base, fuzzy_search)
    attrs = ['cn', 'mail']
    #attrs = ['*']

    try:
        server = ldap3.Server(LDAP_URI)
        with ldap3.Connection(server, user=BIND_DN, password=BIND_PASS, auto_bind=True) as conn:
            #print(conn)
            #print(conn.extend.standard.who_am_i())
            conn.search(SEARCH_BASE, filtr, attributes=attrs)
    except Exception as e:
        print('Error: {}: {}'.format(type(e).__name__, e))
        sys.exit(1)
    return conn.entries



# MAIN

# For some reason the print statements below are important to 
# get searching working properly in mutt
print('Searching … ', end='', flush=True)
entries = ldapQ(SEARCH_TERM)
if len(entries) == 0:
    print('No entries found.')
    sys.exit(1)

print('{:d} entries found.'.format(len(entries)))
for entry in entries:
    for address in entry.mail.values:
        print('{0}\t{1}'.format(address, entry.cn[0]))
