# My hyprland WM dotfiles
### ⚠️ Warning!
#### These dotfiles are made **specifically for 21:9 monitors (2560×1080)** #
#### If you are using a **16:9 display**, you will need to manually adjust window rules #
##### What it looks like: ############
<img width="2559" height="1079" alt="2026-01-06_13-49" src="https://github.com/user-attachments/assets/cc64f924-7082-4d04-a101-7bf87b82af84" />


### ### Apply configs
#### Clone the repo: #
```bash
git clone https://github.com/ar4yc/my-dotfiles.git && cp -r my-dotfiles/* ~/
```

#### Installation hypr-dock #
```bash
yay -S waybar cava playerctl blueman dolphin swaync wofi kitty gtk3 gtk4 qt6ct archlinux-xdg-menu wl-clipboard wtype cliphist flameshot-git waypaper hyprpicker swww pavucontrol bluez bluez-utils alsa-utils pipewire pipewire-pulse wireplumber hyprpolkitagent zsh
```

```bash
git clone https://github.com/lotos-linux/hypr-dock.git
cd hypr-dock
make get
make build
make install
```
