#!/bin/bash
set -e

# Sync dependencies
uv sync

# Create the alias (No crazy escaping needed here!)
echo "alias jlab='uv run jupyter lab --ip=0.0.0.0 --ServerApp.token=\"\" --allow-root'" >> ~/.bashrc

# Register the kernel
uv run python -m ipykernel install --user --name=ai-academy --display-name "Python (UV)"