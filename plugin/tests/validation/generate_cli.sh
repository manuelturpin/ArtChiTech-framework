#!/bin/bash
# generate_cli.sh - Generate a Python CLI for ACT validation

set -e

PROJECT_NAME=${1:-"test-cli"}
TARGET_DIR=${2:-"/tmp/act-validation"}

echo "📦 Generating CLI: $PROJECT_NAME"

mkdir -p "$TARGET_DIR/$PROJECT_NAME"
cd "$TARGET_DIR/$PROJECT_NAME"

# Create structure
mkdir -p src tests

# Create main CLI
cat > src/cli.py << 'EOF'
#!/usr/bin/env python3
"""Simple CLI for ACT validation testing."""

import argparse
import sys

def main():
    parser = argparse.ArgumentParser(description='Test CLI')
    parser.add_argument('command', choices=['hello', 'version'])
    parser.add_argument('--name', default='World')

    args = parser.parse_args()

    if args.command == 'hello':
        print(f"Hello, {args.name}!")
    elif args.command == 'version':
        print("v0.1.0")

    return 0

if __name__ == '__main__':
    sys.exit(main())
EOF

# Create test
cat > tests/test_cli.py << 'EOF'
"""Tests for CLI."""

import subprocess
import sys

def test_hello():
    result = subprocess.run(
        [sys.executable, 'src/cli.py', 'hello'],
        capture_output=True,
        text=True
    )
    assert 'Hello, World!' in result.stdout

def test_version():
    result = subprocess.run(
        [sys.executable, 'src/cli.py', 'version'],
        capture_output=True,
        text=True
    )
    assert 'v0.1.0' in result.stdout
EOF

# Create requirements
cat > requirements.txt << 'EOF'
pytest>=7.0.0
EOF

# Create setup.py
cat > setup.py << 'EOF'
from setuptools import setup, find_packages

setup(
    name='test-cli',
    version='0.1.0',
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'test-cli=src.cli:main',
        ],
    },
)
EOF

echo "✅ CLI generated at: $TARGET_DIR/$PROJECT_NAME"
