#!/bin/bash

#=============================================================== INSTALL ===============================================================#

# TOOLS 
sudo apt update -y
sudo apt install -y git kitty wmname manpages-dev python3 python3-dev arandr scrub flameshot arc-theme fish fzf ripgrep universal-ctags silversearcher-ag fd-find xclip xsel feh bspwm sxhkd polybar rbenv htop lxappearance python3-pip unclutter  papirus-icon-theme imagemagick bat exa ranger watchman libfreetype6-dev libfontconfig1-dev flatpak thunar neofetch

# FLATPAK APPS
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub it.mijorus.smile com.github.marktext.marktext org.gnome.FontManager md.obsidian.Obsidian

# DEPENDENCIES

# bspwm
sudo apt install -y build-essential vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev xserver-xorg-input-all

# polybar
sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev libssl-dev libffi-dev 

# picom
sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev

# rofi
sudo apt install -y bison flex check libpango-1.0-0 libpango1.0-dev libpangocairo-1.0-0 libcairo2 libglib2.0-dev libgdk-pixbuf-2.0-0 libstartup-notification0 libstartup-notification0-dev libgdk-pixbuf-2.0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb-util-dev libxcb-cursor-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xrm-dev librsvg2-dev rofi

# ripgrep - Nvchad telescope
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# PROGRAMS

# bspwm and sxhkd
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
cd ..

# picom
git clone https://github.com/yshui/picom
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ..

# Meslo Nerd Fonts
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output /usr/local/share/fonts/'MesloLGS NF Regular.ttf'
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output /usr/local/share/fonts/'MesloLGS NF Bold.ttf'
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output /usr/local/share/fonts/'MesloLGS NF Italic.ttf'
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output /usr/local/share/fonts/'MesloLGS NF Bold Italic.ttf'
fc-cache -v

# Starship
curl -sS https://starship.rs/install.sh | sh

# radare2
git clone https://github.com/radareorg/radare2
radare2/sys/install.sh

# java dependencies
sudo apt -y install default-jdk

#============================================================ CONFIGURATION ============================================================#

# My dotfiles -> https://github.com/RaulSanchezzt/dotfiles

# Nvim Symlink with vim
sudo ln /usr/bin/nvim /usr/bin/vim -sf

# Move polybar fonts
cp -rf fonts/ ~/.local/share

# Move whichSystem.py 
sudo cp tools/whichSystem.py /usr/bin
sudo chmod +x /usr/bin/whichSystem.py

# Allow Low-Priv Users to Capture Packets (this is because of rofi)
sudo dpkg-reconfigure wireshark-common

#================================================================= END =================================================================#

cat << EOF
███████████████    █████████████████ █████████████████ █████████████████
████████████████   ████████████████  ████████████████  █████████████████
████████████████   ███████████████   ███████████████   █████████████████
█████      ██████          ██████            ██████         ███████
█████     ███████         ██████            ██████          ███████
████████████████         ██████            ██████           ███████
███████████████         ██████            ██████            ███████
█████████████          ██████            ██████             ███████
█████  ███████        ██████            ██████              ███████
█████    ███████     ███████████████   ███████████████      ███████
█████     ███████   ████████████████  ████████████████      ███████
█████      ███████ █████████████████ █████████████████      ███████
EOF

printf "\n$yellow[+] Done, don't forget to follow the next steps as documented in the file README.md\n"$end;
