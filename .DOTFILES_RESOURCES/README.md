# dotfiles

## Management

Run; `yadm clone <THIS_REPO>`

### Class configuration
`yadm config local.class work`

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

