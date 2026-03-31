#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Sara | Reg No: 24BSA10335 | Course: Open Source Software
# Software Choice: Git
# Description: Checks if open source packages are installed
#              and prints philosophy notes using a case statement
# ============================================================

# --- Package to inspect (change to test others) ---
PACKAGE="git"   # Primary: git. Try also: vim, curl, python3, wget

# --- Check if the package is installed using 'command -v' ---
# (macOS doesn't use rpm/dpkg — this is the universal way)
if command -v "$PACKAGE" &>/dev/null; then
    echo "✅  '$PACKAGE' is installed on this system."
    echo ""

    # --- Show version info ---
    echo "--- Version Info ---"
    "$PACKAGE" --version 2>/dev/null || echo "(version flag not supported)"

    # --- Show install location ---
    echo "--- Install Location ---"
    which "$PACKAGE"

    # --- If installed via Homebrew, show more details ---
    if command -v brew &>/dev/null && brew list "$PACKAGE" &>/dev/null; then
        echo ""
        echo "--- Homebrew Details ---"
        # Use grep to filter relevant info from brew info output
        brew info "$PACKAGE" | grep -E 'stable|License|From:|HEAD'
    fi

else
    echo "❌  '$PACKAGE' is NOT installed."
    echo "    To install via Homebrew: brew install $PACKAGE"
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- case statement: prints a philosophy note per package ---
case "$PACKAGE" in
    git)
        echo "Git: Born from necessity — Linus built it in days when"
        echo "     BitKeeper revoked free access. GPL v2 ensures it"
        echo "     stays free forever. It now powers virtually all"
        echo "     software development on Earth."
        ;;
    vim)
        echo "Vim: 'Vi IMproved' — charityware licensed. Every copy"
        echo "     asks you to consider donating to children in Uganda."
        echo "     A reminder that open source can carry human values."
        ;;
    curl)
        echo "curl: MIT licensed, maintained by one person for decades."
        echo "      Runs inside billions of devices. Proof that a single"
        echo "      developer sharing freely can change the world."
        ;;
    python3)
        echo "Python: PSF licensed — shaped entirely by community votes"
        echo "        and PEPs. No corporation owns it. A language that"
        echo "        belongs to everyone who uses it."
        ;;
    wget)
        echo "wget: GPL licensed — a simple tool to retrieve files."
        echo "     Its freedom means anyone can embed it in their OS,"
        echo "     modify it, and redistribute without asking permission."
        ;;
    *)
        echo "Unknown package: '$PACKAGE'"
        echo "Open source means you can always read the source and"
        echo "understand exactly what any tool does to your system."
        ;;
esac

echo ""
echo "============================================================"
echo " Tip: Edit the PACKAGE variable at the top to inspect"
echo " other tools: vim | curl | python3 | wget"
echo "============================================================"
