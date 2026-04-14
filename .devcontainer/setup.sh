#!/usr/bin/env bash
# .devcontainer/setup.sh
set -e

KERNEL_NAME="ai-academy"
KERNEL_DISPLAY_NAME="AI Academy (uv)"

# Install dependencies from uv.lock
uv sync

# Register the uv environment as a Jupyter kernel
uv run python -m ipykernel install --user --name "$KERNEL_NAME" --display-name "$KERNEL_DISPLAY_NAME"

# Set as default kernel
# Uses .py format to stay consistent with the Python feature's jupyter_server_config.py
JUPYTER_CONFIG_DIR="${HOME}/.jupyter"
JUPYTER_CONFIG_FILE="${JUPYTER_CONFIG_DIR}/jupyter_server_config.py"

mkdir -p "$JUPYTER_CONFIG_DIR"

CONFIG_LINE="c.MultiKernelManager.default_kernel_name = '${KERNEL_NAME}'"
if ! grep -qF "$CONFIG_LINE" "$JUPYTER_CONFIG_FILE" 2>/dev/null; then
    echo "$CONFIG_LINE" >> "$JUPYTER_CONFIG_FILE"
fi