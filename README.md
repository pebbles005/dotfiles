## prerequisites

- dunst
- alacritty
- ripgrep
- [node](https://github.com/nodesource/distributions?tab=readme-ov-file#installation-instructions-deb)
- xclip
- [neovim](https://github.com/neovim/neovim/blob/master/BUILD.md) (install eslint globally with npm -g)
- python3.10-venv
- [lemonbar](https://gitlab.com/protesilaos/lemonbar-xft), libxcb-xinerama0-dev, libxcb-randr0-dev, libxft-dev, libx11-dev, libx11-xcb-dev
- rofi
- bspwm
- sxhkd
- feh
- lf
- bat
- mediainfo
- catdoc
- docx2txt
- odt2txt
- ffmpegthumbnailer
- imagemagick
- librsvg2-bin
- mpv
- sxiv
- evince
- file-roller
- [picom](https://github.com/yshui/picom)
- redshift
- [starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- tmux , [tpp](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation) (i.e. run 'prefix I' in tmux to install plugins)
- scrot
- brightnessctl
- zoxide
- fd-find
- [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#using-git)
- htop
- trash-cli
- blueman
- xdotool
- upower
- iw
- lxappearance
- ffmpeg
- bc
- nemo
- ncal
- lftp
- ncmcpp
- mpd

## optional prerequisites

- [ly display manager](https://github.com/fairyglade/ly?tab=readme-ov-file#dependencies)
  ly config file situated in `/etc/ly/config.ini`
  To change the color pallet go to `/lib/systemd/system/ly.service` and add `ExecStartPre=/usr/bin/printf '%%b' '\e]P0191919\e]P7CDD6F4\ec'` in [Service]

          [Service]
          Type=idle
          ExecStartPre=/usr/bin/printf '%%b' '\e]P0191919\e]P7CDD6F4\ec'
          ExecStart=/usr/bin/ly
          StandardInput=tty
          TTYPath=/dev/tty2
          TTYReset=yes
          TTYVHangup=yes
