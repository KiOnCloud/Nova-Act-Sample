#!/bin/bash
# Setup Script for Nova Act (macOS/Linux)

echo "=== Nova Act Setup (macOS/Linux) ==="

# 1. Check python3
if ! command -v python3 &> /dev/null; then
    echo "Python3 not found."
    echo "Install Python 3.10+ using Homebrew:"
    echo " brew install python@3.10"
    exit 1
fi

# 2. Check version
PY_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
REQ_VERSION="3.10"

if [[ "$(printf '%s\n' "$REQ_VERSION" "$PY_VERSION" | sort -V | head -n1)" != "$REQ_VERSION" ]]; then
    echo "Python version $PY_VERSION found, need 3.10+"
    exit 1
fi
echo "Python $PY_VERSION detected"

# 3. Ensure pip
if ! command -v pip3 &> /dev/null; then
    echo "Installing pip..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
fi

# 4. Install Nova Act
echo "Installing Nova Act..."
pip3 install --upgrade nova-act && echo "Nova Act installed successfully"
