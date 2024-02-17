#!/bin/sh
main_dir="$HOME/dotfiles"

# Helper function to create parent directories if missing
ensure_dir() {
    if [ ! -d "$1" ]; then
        echo "Creating directory $1"
        sudo mkdir -p "$1"
    fi
}

# Restore individual files
restore_file() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        echo "Restoring $dest"
        sudo cp "$src" "$dest"
    else
        echo "Warning: $src does not exist, skipping."
    fi
}

# Restore directories with rsync
restore_dir() {
    local src="$1"
    local dest="$2"
    ensure_dir "$dest"
    if [ -d "$src" ]; then
        echo "Restoring directory $dest"
        sudo rsync -av --delete-before "$src" "$dest"
    else
        echo "Warning: $src does not exist, skipping."
    fi
}

# Restore directories using rsync (replaces files but keeps extra files intact)
sync_dir_content() {
    local src="$1"
    local dest="$2"
    ensure_dir "$dest"
    if [ -d "$src" ]; then
        echo "Syncing contents from $src to $dest..."
        rsync -avu "$src/" "$dest/"
    else
        echo "Warning: $src does not exist, skipping."
    fi
}

update_grub() {
    FONT_FILE="/etc/default/console-setup"
    echo "Updating TTY font size to 16x32..."

    # Check if the FONTSIZE is already set correctly
    if grep -q '^FONTSIZE="16x32"$' "$FONT_FILE"; then
        echo "FONTSIZE is already set to 16x32. Skipping update."
    else
        if grep -q '^FONTSIZE=' "$FONT_FILE"; then
            sudo sed -i 's/^FONTSIZE=.*/FONTSIZE="16x32"/' "$FONT_FILE"
        else
            echo 'FONTSIZE="16x32"' | sudo tee -a "$FONT_FILE"
        fi
    fi

    # Remove splash screen in /etc/default/grub
    GRUB_FILE="/etc/default/grub"
    echo "Removing splash screen settings from GRUB..."

    if grep -q '^GRUB_CMDLINE_LINUX_DEFAULT=[[:space:]]*$' "$GRUB_FILE"; then
        echo "GRUB_CMDLINE_LINUX_DEFAULT is already empty. Skipping update."
    else
        sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT=/' "$GRUB_FILE"
    fi

    echo "Updating GRUB configuration..."
    sudo update-grub
    echo "Done! Please reboot to apply the changes."
}

add_user_to_video_group() {
    if id -nG "$USER" | grep -qw "video"; then
        echo "User $USER is already in the video group. Skipping..."
    else
        echo "Adding $USER to the video group..."
        sudo usermod -a -G video "$USER"
        echo "User $USER has been added to the video group."
        echo "reboot to view changes"
    fi
}

# Begin the restore process
restore_file "$main_dir/.bashrc" "$HOME/.bashrc"
restore_file "$main_dir/.Xresources" "$HOME/.Xresources"
restore_file "$main_dir/.fonts.conf" "$HOME/.fonts.conf"
restore_file "$main_dir/.config/starship.toml" "$HOME/.config/starship.toml"
restore_file "$main_dir/extra/xorg.conf" "/etc/X11/"
restore_file "$main_dir/extra/librewolf.overrides.cfg" "$HOME/.librewolf/"

restore_dir "$main_dir/bin/" "$HOME/.local/bin/"
restore_dir "$main_dir/.config/gtk-3.0/" "$HOME/.config/gtk-3.0/"
restore_dir "$main_dir/.config/tmux/" "$HOME/.config/tmux/"
restore_dir "$main_dir/.config/alacritty/" "$HOME/.config/alacritty/"
restore_dir "$main_dir/.config/lemonbar/" "$HOME/.config/lemonbar/"
restore_dir "$main_dir/.config/lf/" "$HOME/.config/lf/"
restore_dir "$main_dir/.config/dunst/" "$HOME/.config/dunst/"
restore_dir "$main_dir/.config/nvim/" "$HOME/.config/nvim/"
restore_dir "$main_dir/.config/mpv/" "$HOME/.config/mpv/"
restore_dir "$main_dir/.config/sxiv/" "$HOME/.config/sxiv/"
restore_dir "$main_dir/.config/rofi/" "$HOME/.config/rofi/"
restore_dir "$main_dir/.config/bspwm/" "$HOME/.config/bspwm/"
restore_dir "$main_dir/.config/mpd/" "$HOME/.config/mpd/"
restore_dir "$main_dir/.config/ncmpcpp/" "$HOME/.config/ncmpcpp/"
restore_dir "$main_dir/.config/sxhkd/" "$HOME/.config/sxhkd/"
restore_dir "$main_dir/.config/htop/" "$HOME/.config/htop/"

# Sync Pictures and extra directories without deleting other files
sync_dir_content "$main_dir/Pictures" "$HOME/Pictures"

# Command to enable brightness control logout login to take effect
add_user_to_video_group

# updating grub config
update_grub

echo "setup have been done."
