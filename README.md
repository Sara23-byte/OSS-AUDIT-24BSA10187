# Open Source Audit Project

## 👤 Student Details

* **Name:** Sara
* **Roll Number:** 24BSA10335

---

## 💻 Chosen Software

* **Software:** Git
* **Category:** Version Control System
* **License:** GNU General Public License v2 (GPL v2)

---

## 📌 Project Overview

This project presents a detailed audit of the open-source software Git. It explores the origin, licensing model, ethical considerations, Linux footprint, and ecosystem of Git. Additionally, five shell scripts have been developed to demonstrate practical Linux and automation skills.

---

## 🧾 Scripts Included

### 🔹 Script 1 — System Identity Report

Displays system information such as:

* Linux distribution
* Kernel version
* Current user
* System uptime
* Date and time

---

### 🔹 Script 2 — FOSS Package Inspector

* Checks if Git is installed
* Displays version and package details
* Uses conditional statements and case structure

---

### 🔹 Script 3 — Disk and Permission Auditor

* Audits important system directories
* Displays permissions, ownership, and disk usage
* Checks Git configuration file

---

### 🔹 Script 4 — Log File Analyzer

* Reads a log file
* Counts occurrences of a keyword (default: error)
* Displays last 5 matching lines

---

### 🔹 Script 5 — Open Source Manifesto Generator

* Takes user input
* Generates a personalized manifesto
* Saves output to a text file

---

## ⚙️ Complete Procedure (Step-by-Step)

### 🔹 Step 1: Setup Linux Environment

1. Install WSL (Windows Subsystem for Linux):

   ```bash
   wsl --install
   ```
2. Install Ubuntu and complete setup.

---

### 🔹 Step 2: Install Git

```bash
sudo apt update
sudo apt install git
```

---

### 🔹 Step 3: Create Project Directory

```bash
mkdir oss-audit
cd oss-audit
```

---

### 🔹 Step 4: Create Shell Scripts

Create scripts using:

```bash
nano script1.sh
nano script2.sh
nano script3.sh
nano script4.sh
nano script5.sh
```

Make them executable:

```bash
chmod +x *.sh
```

Run scripts:

```bash
./script1.sh
./script2.sh
./script3.sh
./script4.sh /var/log/syslog error
./script5.sh
```

---

### 🔹 Step 5: Initialize Git Repository

```bash
git init
git add .
git commit -m "Initial commit"
```

---

### 🔹 Step 6: Connect to GitHub

```bash
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
git branch -M main
git push -u origin main
```

---

### 🔹 Step 7: Authentication

* Username → Your GitHub username
* Password → Personal Access Token (PAT)

---

### 🔹 Step 8: Create README.md

```bash
nano README.md
```

Add project details and push:

```bash
git add README.md
git commit -m "Added README"
git push
```

---

## 🧩 Requirements

* Linux (Ubuntu/WSL)
* Git installed
* Basic command-line knowledge

---

## 📚 Learning Outcomes

* Understanding open-source philosophy
* Knowledge of software licensing (GPL)
* Hands-on Linux experience
* Shell scripting skills
* Version control using Git

---

## 📂 Repository Structure

```
oss-audit/
│── script1.sh
│── script2.sh
│── script3.sh
│── script4.sh
│── script5.sh
│── README.md
```

---

## 📌 Conclusion

This project provided both theoretical and practical understanding of open-source software using Git. It demonstrated how open-source tools promote collaboration, transparency, and innovation while also improving technical skills in Linux and shell scripting.

---
