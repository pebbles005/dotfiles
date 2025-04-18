Automated Setup for base Arch

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
