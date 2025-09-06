#  Nova Act Setup Guide

This repository provides setup scripts and demo resource for preparing your environment to run **Nova Act**.  
It will install Python (if required) and the **Nova Act** Python package.

---

## Setup Environment

### 1. macOS / Linux

```bash
# Make script executable
chmod +x setup_mac.sh

# Run setup
./setup_mac.sh
```

### 2. Windows
```bash
setup_windows.bat
```
## Add Nova Act API Key

### 1. macOS / Linux

```bash
export NOVA_ACT_API_KEY="your_api_key_here"
```

### 2. Windows
```bash
$env:NOVA_ACT_API_KEY="your_api_key_here"
```