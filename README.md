## prerequisites

- dunst
- alacritty
- ripgrep
- [node](https://github.com/nodesource/distributions?tab=readme-ov-file#installation-instructions-deb)
- xclip
- [neovim](https://github.com/neovim/neovim/blob/master/BUILD.md) (install eslint globally)
- python3.10-venv
- lemonbar (https://gitlab.com/protesilaos/lemonbar-xft)
- rofi
- [rofi-calc](https://github.com/svenstaro/rofi-calc) (use all build commands with sudo)
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
- [fastfetch](https://github.com/fastfetch-cli/fastfetch?tab=readme-ov-file#linux)
- maim
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

## Install command for all the repo available pkg

        nala install dunst alacritty ripgrep xclip python3.12-venv rofi bspwm sxhkd feh lf bat mediainfo catdoc docx2txt odt2txt ffmpegthumbnailer imagemagick mpv sxiv evince file-roller redshift tmux maim brightnessctl zoxide fd-find lxappearance htop trash-cli blueman upower iw ffmpeg

## optional prerequisites

- [i3](https://i3wm.org/docs/repositories.html)
- [autotiling](https://pypi.org/project/autotiling/)
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
