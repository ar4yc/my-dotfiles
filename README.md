# My hyprland WM dotfiles
### ⚠️ Warning!
#### These dotfiles are made **specifically for 21:9 monitors (2560×1080)** #
#### If you are using a **16:9 display**, you will need to manually adjust window rules #
##### What it looks like: ############
<img width="2559" height="1079" alt="2026-01-09_14-25" src="https://github.com/user-attachments/assets/719e5606-4a1f-4c6f-a9f6-c27cbf95a80d" />


#### Clone dotfiles: #
```bash
git clone https://github.com/ar4yc/my-dotfiles.git && cp -r my-dotfiles/.config "$HOME/"
```
#### Install Programs #
```bash
yay -S waybar cava playerctl blueman dolphin xava swaync wofi kitty gtk3 gtk4 qt6ct archlinux-xdg-menu wl-clipboard wtype cliphist flameshot-git waypaper hyprpicker swww pavucontrol bluez bluez-utils alsa-utils pipewire pipewire-pulse wireplumber hyprpolkitagent zsh
```
#### Installation hypr-dock #
```bash
git clone https://github.com/lotos-linux/hypr-dock.git
cd hypr-dock
make get
make build
make install
```
