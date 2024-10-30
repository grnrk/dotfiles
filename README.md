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

## .DOTFILES_RESOURCES

This directory holds everything that is related to dotfiles configuration and/or other things that always should be in place on any computer.

### Layout

* **/bin** -  Executables here are selectively symlinked to /usr/local/bin.
  * **nodisplay** - Bins that should be available on _all_ systems.
  * **display**   - Bins for any computer with a display.

Files in the bin directory may be appended with an ending of _.install_ to be copied instead of symlinked.

* **/bootstrap** - Scripts executed from .yadm/bootstrap.

* **/etc** - Configuration files for /etc.

* **/system** - System configuration items.

## Git submodules

**Clone incl. submodules**

```
git clone --recurse-submodules <repo>
```

**Adding new submodules**

```
git submodule add <GIT-REMOTE> <LOCAL_PATH>
```

**Install (already cloned repository)**

```
git submodule update --init --recursive
```

**Update**

```
git pull --recurse-submodules
```

**Remove**

```
git submodule deinit <path_to_submodule>
git rm <path_to_submodule>
```

# Linux

## Keychron keyboard

### Function keys
<https://mikeshade.com/posts/keychron-linux-function-keys/>

> echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
>
> sudo update-initramfs -u

