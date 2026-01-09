# My hyprland WM dotfiles
### ⚠️ Warning!
#### These dotfiles are made **specifically for 21:9 monitors (2560×1080)** #
#### If you are using a **16:9 display**, you will need to manually adjust window rules #
##### What it looks like: ############
![Uploading 2026-01-09_14-25.png…]()


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
