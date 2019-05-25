# dotfiles

## Management

Run; `yadm clone <THIS_REPO> --bootstrap`

_No files in the repository may exist locally or clone will fail._

**Set class**
`yadm config local.class <class>`
_Only one local class at the time is configurable_

Available classes:
* work

**Unset class**
`yadm config local.class ''`


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

