# sway

## Packages

(These should be included in yadm bootstrap package list)

- sway
- swaylock
- swayidle
- swayimg
- waybar
- wofi
- kanshi
- mako-notifier
- fonts-font-awesome
- brightnessctl
- brightness-udev
- wdisplays - GUI display configuration
- grimshot
- wofi-pass - wofi menu integration to pass

### shikane

[Shikane](https://gitlab.com/w0lff/shikane) is a tool for dynamic output configuration.  
It is principally based on _kanshi_, but offers far greater flexibility and configurability.  
It does require wlroots >= v0.16  

See documentation for build info, but basically:

```bash
cargo build --release

sudo cp target/release/shikane  /usr/local/bin/
sudo cp target/release/shikanectl  /usr/local/bin/
```

```bash
./scripts/build-docs.sh man

man -l build/man/shikane.1.gz
man -l build/man/shikane.5.gz
man -l build/man/shikanectl.1.gz

sudo cp  build/man/shikane*.1.gz  /usr/local/share/man/man1/
sudo cp  build/man/shikane.5.gz  /usr/local/share/man/man5/
```

## Volume and brightness in notifier

<https://github.com/JaKooLit/Ja_HyprLanD-dots/blob/main/config/hypr/scripts/volume>
<https://github.com/JaKooLit/Ja_HyprLanD-dots/blob/main/config/hypr/scripts/brightness>

<https://gitlab.com/Nmoleo/i3-volume-brightness-indicator>
