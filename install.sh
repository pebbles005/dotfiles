#!/bin/sh

# creating nessesery folders
mkdir -p Github/ Projects/

# installing nala
sudo apt install nala -y

# installing generic packages
sudo nala install -y dunst alacritty ripgrep xclip python3.12-venv rofi bspwm sxhkd feh lf bat mediainfo catdoc docx2txt odt2txt ffmpegthumbnailer imagemagick mpv sxiv evince file-roller redshift tmux scrot brightnessctl zoxide fd-find lxappearance htop trash-cli blueman upower iw ffmpeg libxcb-xinerama0-dev libxcb-randr0-dev libxft-dev libx11-dev libx11-xcb-dev bc ani-cli

# installing node
sudo nala install -y curl
curl -fsSL https://deb.nodesource.com/setup_23.x -o $HOME/Github/nodesource_setup.sh
sudo -E bash $HOME/Github/nodesource_setup.sh
sudo nala install -y nodejs

# installing neovim
sudo nala install -y ninja-build gettext cmake curl build-essential
git clone https://github.com/neovim/neovim $HOME/Github/neovim/
cd $HOME/Github/neovim/
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install &
sudo npm i -g eslint
cd $HOME

# installing starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# installing tpp
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#installing fzf
sudo dpkg -r --force-depends fzf
nala remove -y fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/Github/.fzf
sudo -E bash $HOME/Github/.fzf/install --all

#installing picom
sudo nala install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev
git clone https://github.com/yshui/picom $HOME/Github/picom/
cd $HOME/Github/picom/
sudo meson setup --buildtype=release build &
sudo ninja -C build &
sudo ninja -C build install &
cd $HOME

#installing lemonbar
sudo nala install -y libxcb-xinerama0-dev libxcb-randr0-dev libxft-dev libx11-dev libx11-xcb-dev
git clone https://gitlab.com/protesilaos/lemonbar-xft $HOME/Github/lemonbar/
cd $HOME/Github/lemonbar/
sudo make install &
cd $HOME
