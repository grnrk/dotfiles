# dotfiles

## Management

Run; `yadm clone <THIS_REPO>`

_No files in the repository may exist locally or clone will fail._

**Define if laptop**\
Set the hostname of laptop in the _LAPTOPS_ variable in .yadm/bootstrap.

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

* **/bin** -  Executables here are selectively symlinked to /usr/local/bin via .yadm/bootstrap.
  * **i3**  - Bins that are exclusively needed with i3wm.
  * **nox** - Bins that should be available on _all_ systems.
  * **x**   - Bins for any computer with a display.

Files in the bin directory may be appended with an ending of _.install_ to be copied instead of symlinked.


* **/bootstrap** - Scripts executed from .yadm/bootstrap.

* **/etc** - Configuration files for /etc.

* **/gitprompt** - The path to this git submodule is referenced directly to from config.fish.

* **/system** - System configuration items.


## Git submodules

__Clone incl. submodules__
```
git clone --recurse-submodules <repo>
```
OR (older):
```
git clone --recursive <repo>
```

__Adding new submodules__
```
git submodule add <GIT-REMOTE> <LOCAL_PATH>
```

__Install (already cloned repository)__
```
git submodule update --init --recursive
```

__Update__
```
git pull --recurse-submodules
```
OR (older):
```
git submodule update --recursive --remote
```

