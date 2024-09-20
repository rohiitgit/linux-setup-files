#!/bin/bash

# Check if the YAML file exists
YAML_FILE="packages.yaml"
if [[ ! -f "$YAML_FILE" ]]; then
    echo "YAML file '$YAML_FILE' not found!"
    exit 1
fi

# Read packages from the YAML file
packages=$(grep '^[[:space:]]*-' "$YAML_FILE" | sed 's/^[[:space:]]*-[[:space:]]*//')

# Install the packages using pacman
for package in $packages; do
    echo "Installing $package..."
    sudo pacman -S --noconfirm "$package"
done

echo "All packages installed."
