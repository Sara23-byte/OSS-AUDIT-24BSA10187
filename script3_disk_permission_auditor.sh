#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Sara | Reg No: 24BSA10335 | Course: Open Source Software
# Software Choice: Git
# Description: Loops through key directories, reports size
#              and permissions. Also checks Git's config dir.
# ============================================================

# --- List of important macOS system directories to audit ---
DIRS=("/etc" "/var/log" "/tmp" "/usr/bin" "/usr/local/bin")

echo "======================================================="
echo "          Directory Audit Report — macOS"
echo "======================================================="
echo ""

# --- for loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do

    # --- if-then-else: check if directory actually exists ---
    if [ -d "$DIR" ]; then

        # --- Extract permissions, owner, group using awk ---
        # ls -ld gives: drwxr-xr-x  owner  group ...
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')   # e.g., drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')   # e.g., root
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')   # e.g., wheel

        # --- Get directory size (suppress permission errors) ---
        # du -sh gives human-readable size; cut gets first field
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "📁  $DIR"
        echo "    Permissions : $PERMS"
        echo "    Owner/Group : $OWNER / $GROUP"
        echo "    Size        : ${SIZE:-unknown}"
        echo ""

    else
        # Directory not found on this system
        echo "⚠️   $DIR — does not exist on this system"
        echo ""
    fi

done

# ============================================================
# BONUS: Check Git's important config locations on macOS
# ============================================================
echo "-------------------------------------------------------"
echo "  Git Configuration Directory Audit"
echo "-------------------------------------------------------"
echo ""

# Array of Git-specific paths to check
GIT_PATHS=(
    "$HOME/.gitconfig"              # User-level global config
    "$HOME/.git-credentials"        # Stored credentials (if any)
    "/usr/local/etc/gitconfig"      # System-level config (Homebrew Git)
    "/etc/gitconfig"                # System-level config (system Git)
    "$(git --exec-path 2>/dev/null)" # Git's internal exec path
)

for GPATH in "${GIT_PATHS[@]}"; do
    if [ -e "$GPATH" ]; then
        # Get permissions of the file or directory
        PERMS=$(ls -ld "$GPATH" | awk '{print $1}')
        OWNER=$(ls -ld "$GPATH" | awk '{print $3}')
        echo "✅  $GPATH"
        echo "    Permissions : $PERMS  |  Owner: $OWNER"
    else
        echo "➖  $GPATH — not found (that's okay)"
    fi
    echo ""
done

echo "======================================================="
echo " Why permissions matter for security:"
echo " Git config files can store credentials and signing"
echo " keys. A world-readable .gitconfig can leak tokens."
echo " Open source tools respect your system's permission"
echo " model — you stay in control."
echo "======================================================="
