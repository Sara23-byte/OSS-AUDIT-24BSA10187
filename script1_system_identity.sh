#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software
# Software Choice: Git
# Description: Displays system info and open source context
# ============================================================

# --- Variables ---
STUDENT_NAME="Sara"                 # Student Name
REG_NO="24BSA10335"                 # Registration Number
SOFTWARE_CHOICE="Git"               # Chosen open source software

# --- Gather system info using command substitution $() ---
KERNEL=$(uname -r)                  # macOS kernel/Darwin version
OS_NAME=$(sw_vers -productName)     # e.g., macOS
OS_VERSION=$(sw_vers -productVersion) # e.g., 14.4.1
USER_NAME=$(whoami)                 # Current logged-in user
HOME_DIR=$HOME                      # User's home directory
CURRENT_DATE=$(date '+%d %B %Y %H:%M:%S')  # Formatted date and time
UPTIME_RAW=$(uptime | sed 's/.*up //' | sed 's/,.*//')  # Extract uptime

# --- Get Git version if installed ---
if command -v git &>/dev/null; then
    GIT_VERSION=$(git --version)    # e.g., git version 2.44.0
else
    GIT_VERSION="Git is NOT installed"
fi

# --- Display formatted report ---
echo "======================================================="
echo "       Open Source Audit — $STUDENT_NAME"
echo "       Reg No : $REG_NO"
echo "       Software: $SOFTWARE_CHOICE"
echo "======================================================="
echo ""
echo "  OS           : $OS_NAME $OS_VERSION"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Date/Time    : $CURRENT_DATE"
echo "  Uptime       : $UPTIME_RAW"
echo ""
echo "  Git Found    : $GIT_VERSION"
echo ""
echo "-------------------------------------------------------"
echo "  License Note :"
echo "  Git is licensed under the GNU General Public License"
echo "  version 2 (GPL v2). macOS itself uses a Darwin kernel"
echo "  with mixed open/closed components. The shell (bash/zsh)"
echo "  is covered by GPL and LGPL licenses."
echo "======================================================="
