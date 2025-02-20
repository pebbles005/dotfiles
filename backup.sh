#!/bin/sh
main_dir="$HOME/dotfiles"
config_dir="$main_dir/config"
fonts_dir="$main_dir/fonts"
extra_dir="$main_dir/extra"

# Create necessary directories if they don't exist
mkdir -p "$config_dir" "$fonts_dir" "$extra_dir"

# Function to copy single files if they exist
copy_file() {
    [ -f "$1" ] && cp "$1" "$2" || echo "$1 does not exist."
}

# Function to copy directories with rsync if they exist
copy_dir() {
    [ -d "$1" ] && rsync -av --delete-before "$1" "$2" || echo "$1 does not exist."
}

# Copy individual configuration files
copy_file "$HOME/.config/tmux/tmux.conf" "$config_dir/tmux/"
copy_file "$HOME/.config/tmux/tmux-sessionizer" "$config_dir/tmux/"
copy_file "$HOME/.config/starship.toml" "$config_dir/"
copy_file "$HOME/.fonts.conf" "$main_dir/"
copy_file "$HOME/.bashrc" "$main_dir/"
copy_file "$HOME/.Xresources" "$main_dir/"

# Copy configuration directories
copy_dir "$HOME/.config/kitty/" "$config_dir/kitty/"
copy_dir "$HOME/.config/alacritty/" "$config_dir/alacritty/"
copy_dir "$HOME/.config/polybar/" "$config_dir/polybar/"
copy_dir "$HOME/.config/gtk-3.0/" "$config_dir/gtk-3.0/"
copy_dir "$HOME/.config/lemonbar/" "$config_dir/lemonbar/"
copy_dir "$HOME/.config/lf/" "$config_dir/lf/"
copy_dir "$HOME/.config/dunst/" "$config_dir/dunst/"
copy_dir "$HOME/.config/nvim/" "$config_dir/nvim/"
copy_dir "$HOME/.config/mpv/" "$config_dir/mpv/"
copy_dir "$HOME/.config/sxiv/" "$config_dir/sxiv/"
copy_dir "$HOME/.config/rofi/" "$config_dir/rofi/"
copy_dir "$HOME/.config/i3/" "$config_dir/i3/"
copy_dir "$HOME/.config/bspwm/" "$config_dir/bspwm/"
copy_dir "$HOME/.config/picom/" "$config_dir/picom/"
copy_dir "$HOME/.config/sxhkd/" "$config_dir/sxhkd/"
copy_dir "$HOME/.config/htop/" "$config_dir/htop/"
copy_dir "$HOME/.local/share/fonts/" "$fonts_dir/"
copy_dir "$HOME/.config/fastfetch/" "$config_dir/fastfetch/"
