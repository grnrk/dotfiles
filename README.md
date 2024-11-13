# dotfiles

## Management

Run; `yadm clone <THIS_REPO>`

_No files in the repository may exist locally or clone will fail._

**Set class**\
`yadm config local.class <class>`
_Only one local class at the time is configurable_

Available classes:

* work

**Unset class**
`yadm config local.class ''`

Run; `yadm bootstrap`

## Resources

Additional bootstrap related resources can be found under `.config/yadm`.

### Layout

* **/bin** -  Executables here are selectively symlinked to /usr/local/bin.
  * **nodisplay** - Bins that should be available on _all_ systems.
  * **display**   - Bins for any computer with a display.

Files in the bin directory may be appended with an ending of _.install_ to be copied instead of symlinked.

* **/bootstrap.d** - Scripts executed from .yadm/bootstrap.

* **/etc** - Configuration files for /etc.

* **/system** - System configuration items.

## Git submodules

### Updating submodule to a new tag/branch

`cd path/to/submodule`  
`git co <tag/branch>`  
`cd path/to/parentgit`  
`git add path/to/submodule`  
`git commit -am "updated to <tag/branch>"`  

### Clone incl. submodules

```text
git clone --recurse-submodules <repo>
```

### Adding new submodules

```text
git submodule add <GIT-REMOTE> <LOCAL_PATH>
```

### Install (already cloned repository)

```text
git submodule update --init --recursive
```

### Update

```text
git pull --recurse-submodules
```

### Remove

```text
git submodule deinit <path_to_submodule>
git rm <path_to_submodule>
```

## Linux

### Brightness

`brightnessctl` is used for adjusting screen brightness levels.  
`brightness-udev` installs UDEV rules to allow rootless modification of screen brightness and led lights.  
This means that $USER must be added to the `video` group (but this is probably done by default by installing the package?)

### Keychron keyboard

#### Function keys

<https://mikeshade.com/posts/keychron-linux-function-keys/>

```bash
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf

sudo update-initramfs -u
```

