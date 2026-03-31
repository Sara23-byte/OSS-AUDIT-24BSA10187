# oss-audit-24BSA10335

**Open Source Software Audit — Capstone Project**
**Course:** Open Source Software (OSS NGMC)
**Student:** Sara
**Registration Number:** 24BSA10335
**Chosen Software:** Git

---

## About This Project

This repository contains five shell scripts written as part of the Open Source Audit capstone project. The scripts explore Git — one of the world's most widely used open-source tools — through practical Linux/macOS command-line tasks. Each script demonstrates a core set of shell scripting concepts mapped to the course units.

---

## Scripts Overview

| File | Script Name | What It Does |
|------|-------------|--------------|
| `script1_system_identity.sh` | System Identity Report | Displays OS info, kernel version, logged-in user, uptime, Git version, and open source license note |
| `script2_package_inspector.sh` | FOSS Package Inspector | Checks if Git (or other tools) are installed, shows version and Homebrew details, prints philosophy notes via a `case` statement |
| `script3_disk_permission_auditor.sh` | Disk & Permission Auditor | Loops through key system directories and reports their size, permissions, and owner. Also audits Git-specific config file locations |
| `script4_log_analyzer.sh` | Log File Analyzer | Reads a log file line by line, counts how many lines match a keyword, and prints the last 5 matching lines |
| `script5_manifesto_generator.sh` | Open Source Manifesto Generator | Asks 3 interactive questions and writes a personalised open source philosophy statement to a `.txt` file |

---

## Shell Concepts Used

| Concept | Where Used |
|---------|-----------|
| Variables & command substitution `$()` | Script 1 |
| `if-then-else` | Scripts 2, 3, 4 |
| `case` statement | Script 2 |
| `for` loop | Script 3 |
| `while read` loop | Script 4 |
| `read` for user input | Script 5 |
| Counter variables | Script 4 |
| Command-line arguments `$1`, `$2` | Script 4 |
| Writing to files with `>` and `>>` | Script 5 |
| `grep`, `awk`, `cut`, `tail` | Scripts 2, 3, 4 |
| Aliases (demonstrated as a function) | Script 5 |

---

## Dependencies

- **macOS** with Zsh or Bash (all scripts use `#!/bin/bash`)
- **Git** — install via [Homebrew](https://brew.sh): `brew install git`
- **Homebrew** *(optional but recommended)* — Script 2 uses `brew info` for extra package details. Scripts still run without it.

---

## How to Run

### Step 1 — Clone the repository

```bash
git clone https://github.com/[your-username]/oss-audit-24BSA10335.git
cd oss-audit-24BSA10335
```

### Step 2 — Make all scripts executable

```bash
chmod +x script1_system_identity.sh \
         script2_package_inspector.sh \
         script3_disk_permission_auditor.sh \
         script4_log_analyzer.sh \
         script5_manifesto_generator.sh
```

### Step 3 — Run each script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```
No arguments needed. Displays your system info and Git's license.

---

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```
No arguments needed. Inspects `git` by default. To check another tool, open the script and change the `PACKAGE` variable at the top (e.g., `vim`, `curl`, `python3`).

---

**Script 3 — Disk & Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```
No arguments needed. Audits `/etc`, `/var/log`, `/tmp`, `/usr/bin`, `/usr/local/bin`, and Git config file locations.

---

**Script 4 — Log File Analyzer**
```bash
# First, generate a sample log file from your Git history:
git log --oneline > ~/git_activity.log

# Then run the analyzer:
./script4_log_analyzer.sh ~/git_activity.log fix
```
Arguments: `<logfile path>` and optionally `<keyword>` (default keyword is `error`).
Works with any plain text log file, e.g., `/var/log/install.log`.

---

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
```
Interactive — the script will ask you three questions and save your manifesto to `manifesto_<yourusername>.txt`.

---

## Expected Output Examples

**Script 1:**
```
=======================================================
       Open Source Audit — Sara
       Reg No : 24BSA10335
       Software: Git
=======================================================
  OS           : macOS 14.4.1
  Kernel       : 23.4.0
  User         : sara
  Git Found    : git version 2.44.0
```

**Script 4:**
```
=======================================================
  Log File Analyzer
  File    : /Users/sara/git_activity.log
  Keyword : 'fix' (case-insensitive)
=======================================================
🔍  Keyword 'fix' found 7 time(s) in git_activity.log
```

---

## Repository Structure

```
oss-audit-24BSA10335/
├── README.md
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_permission_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh
```

---
