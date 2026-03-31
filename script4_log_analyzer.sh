#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Sara | Reg No: 24BSA10335 | Course: Open Source Software
# Software Choice: Git
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints matching lines.
#
# Usage:
#   ./script4_log_analyzer.sh /path/to/logfile [keyword]
#
# Examples:
#   ./script4_log_analyzer.sh /var/log/install.log error
#   ./script4_log_analyzer.sh ~/git_activity.log push
# ============================================================

# --- Command-line arguments ---
LOGFILE=$1                    # First argument: path to log file
KEYWORD=${2:-"error"}         # Second argument: keyword (default: "error")

# --- Counter variable (starts at zero) ---
COUNT=0

# ============================================================
# Input validation: check file was provided and exists
# ============================================================
if [ -z "$LOGFILE" ]; then
    echo "❌  Usage: $0 <logfile> [keyword]"
    echo "    Example: $0 /var/log/install.log warning"
    exit 1
fi

# --- Retry loop: if file doesn't exist, ask user once more ---
ATTEMPTS=0
while [ ! -f "$LOGFILE" ]; do
    ATTEMPTS=$((ATTEMPTS + 1))

    # Only retry once (do-while style: try, then check)
    if [ $ATTEMPTS -ge 2 ]; then
        echo "❌  File '$LOGFILE' still not found. Exiting."
        echo ""
        echo "💡  On macOS, try one of these real log files:"
        echo "    /var/log/install.log"
        echo "    /var/log/system.log"
        echo "    ~/Library/Logs/  (contains many app logs)"
        echo ""
        echo "    Or generate a git activity log first:"
        echo "    git log --oneline > ~/git_activity.log"
        exit 1
    fi

    echo "⚠️   File not found: '$LOGFILE'"
    read -p "    Enter a different file path (or press Enter to quit): " NEW_PATH

    # If user pressed Enter without typing, exit
    if [ -z "$NEW_PATH" ]; then
        echo "Exiting."
        exit 1
    fi

    LOGFILE="$NEW_PATH"   # Update the file path and retry the while check
done

# ============================================================
# Check if file is empty before processing
# ============================================================
if [ ! -s "$LOGFILE" ]; then
    echo "⚠️   The file '$LOGFILE' exists but is empty."
    echo "    Nothing to analyze."
    exit 0
fi

echo "======================================================="
echo "  Log File Analyzer"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD' (case-insensitive)"
echo "======================================================="
echo ""

# ============================================================
# while read loop: read the file line by line
# IFS= preserves leading/trailing whitespace in each line
# ============================================================
while IFS= read -r LINE; do

    # --- if-then: check if this line contains the keyword ---
    # grep -i = case insensitive, -q = quiet (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi

done < "$LOGFILE"   # Feed the file into the while loop

# --- Print summary ---
echo "🔍  Keyword '$KEYWORD' found $COUNT time(s) in $(basename "$LOGFILE")"
echo ""

# ============================================================
# Show last 5 matching lines using grep + tail
# ============================================================
if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 matching lines ---"
    # grep -i: case-insensitive | tail -5: last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
else
    echo "ℹ️   No lines matched '$KEYWORD'."
    echo "    Try a different keyword like: warning | info | fatal | push"
fi

echo ""
echo "======================================================="
echo " Git Tip: You can analyze your own Git log!"
echo " Run: git log --oneline > ~/git_activity.log"
echo " Then: $0 ~/git_activity.log fix"
echo "======================================================="
