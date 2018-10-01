# dotfiles

## Git submodules

__Clone incl. submodules__
```
git clone --recurse-submodules <repo>
```
OR (older):
```
git clone --recursive <repo>
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

