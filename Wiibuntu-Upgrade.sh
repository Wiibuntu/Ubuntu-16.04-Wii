#!/usr/bin/env bash
set -euo pipefail

#### ──────── CONFIGURATION ──────── ####
UUID="CFC6-4C2F"
MOUNT_POINT="/boot"

URL_ZIMAGE="https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/download/zImage-060725/zImage"
URL_ZIMAGE2="https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/download/zImage-060725/zImage2"
URL_FSTAB="https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/download/zImage-060725/fstab"
URL_MODULES_ZIP="https://github.com/Wiibuntu/Ubuntu-16.04-Wii/releases/download/zImage-060725/4.20.0-wii.zip"

# The name of the modules folder inside the ZIP (and existing folder to replace)
MODULES_VERSION="4.20.0-wii"
######################################

# 1. Must be root
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run this script as root."
  exit 1
fi

# 2. OS‐version check via ~/.wiibuntu.txt
WIIBUNTU_FILE="$HOME/.wiibuntu.txt"
if [[ ! -f "$WIIBUNTU_FILE" ]]; then
  read -p "Are you on a Wii? [y/N]: " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "v1.0" > "$WIIBUNTU_FILE"
    echo "✅ Created $WIIBUNTU_FILE with version v1.0"
  else
    echo "❌ Not a Wii. Exiting."
    exit 1
  fi
fi
CURRENT_VERSION=$(<"$WIIBUNTU_FILE")
if [[ "$CURRENT_VERSION" != "v1.0" ]]; then
  echo "❌ Unexpected OS version: \"$CURRENT_VERSION\". Expected v1.0."
  exit 1
fi
echo "✅ Detected Wiibuntu version $CURRENT_VERSION"

# 3. Find the device by UUID
DEVICE=$(blkid -U "$UUID") || {
  echo "❌ Device with UUID $UUID not found."
  exit 1
}

# 4. Prepare and mount
mkdir -p "$MOUNT_POINT"
if ! mountpoint -q "$MOUNT_POINT"; then
  echo "🔧 Mounting $DEVICE → $MOUNT_POINT"
  mount "$DEVICE" "$MOUNT_POINT"
else
  echo "ℹ️  Already mounted on $MOUNT_POINT"
fi

# 5. Verify gumboot folder exists
TARGET_DIR="$MOUNT_POINT/gumboot"
if [[ ! -d "$TARGET_DIR" ]]; then
  echo "❌ Directory $TARGET_DIR does not exist."
  exit 1
fi

# 6. Download new zImage files
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "⬇️  Downloading new zImage files..."
wget --progress=bar:force -O "$TMPDIR/zImage"  "$URL_ZIMAGE"
wget --progress=bar:force -O "$TMPDIR/zImage2" "$URL_ZIMAGE2"

# 7. Backup and replace zImage files
for F in zImage zImage2; do
  if [[ -e "$TARGET_DIR/$F" ]]; then
    BACKUP="$TARGET_DIR/${F}.bak"
    cp "$TARGET_DIR/$F" "$BACKUP"
    echo "💾 Backed up $F → $(basename "$BACKUP")"
  fi
  cp "$TMPDIR/$F" "$TARGET_DIR/$F"
done
sync

# 8. Download and replace /etc/fstab on the device
FSTAB_PATH="/etc/fstab"
echo "⬇️  Downloading new fstab..."
wget --progress=bar:force -O "$TMPDIR/fstab" "$URL_FSTAB"

if [[ -e "$FSTAB_PATH" ]]; then
  BACKUP_FSTAB="/etc/fstab.bak_$(date +%Y%m%d%H%M%S)"
  cp "$FSTAB_PATH" "$BACKUP_FSTAB"
  echo "💾 Backed up existing fstab → $(basename "$BACKUP_FSTAB")"
fi

echo "⚙️  Installing new fstab..."
cp "$TMPDIR/fstab" "$FSTAB_PATH"
sync

# 9. Module upgrade: download, remove old, extract new
MODULES_DIR="/lib/modules"
echo "⬇️  Downloading new kernel modules..."
wget --progress=bar:force -O "$TMPDIR/modules.zip" "$URL_MODULES_ZIP"

OLD_MODULE_PATH="$MODULES_DIR/$MODULES_VERSION"
if [[ -d "$OLD_MODULE_PATH" ]]; then
  echo "🗑️  Removing old modules at $OLD_MODULE_PATH"
  rm -rf "$OLD_MODULE_PATH"
fi

echo "📦 Extracting new modules into $MODULES_DIR"
unzip -q "$TMPDIR/modules.zip" -d "$MODULES_DIR"
sync

# 10. Bump OS version to v1.2
echo "v1.2" > "$WIIBUNTU_FILE"
echo "🎉 Updated Wiibuntu version to $(<"$WIIBUNTU_FILE")"

echo "✅ All updates complete!"

