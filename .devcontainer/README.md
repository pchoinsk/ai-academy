# AI Academy - Devcontainer Setup

## Base Image

Uses `mcr.microsoft.com/devcontainers/python:3.12` image with Python pre-installed. 

## Features
- **uv** - fast Python package and project manager, used for dependency management.
- **JupyterLab** - included un UV managed environment, allowing you to run notebooks with the project dependencies.

## Lifecycle

The `setup.sh` script runs during `updateContentCommand` does:

1. **`uv sync`** - installs project dependencies from `uv.lock` into a `.venv` environment.
1. **Registers a Jupyter kernel** - makes the uv environment available as "AI Academy (uv)" in JupyterLab's kernel picker.
1. **Sets it as the default kernel** - new notebooks open with the project environment pre-selected.
1. **Adds an alias for starting JupyterLab** - you can run `jlab-start` in the terminal to start JupyterLab directly from the Codespace.

The `postCreateCommand` in `devcontainer.json` runs `jlab-start`, which means JupyterLab will automatically when the Codespace is ready.
Just click on the notification to open it on a new tab or check the "Ports" tab in the Codespaces menu to find the URL.

## Prerequisites

Your `pyproject.toml` must include `ipykernel` and `jupyterlab` as dependencies:

```bash
uv add ipykernel
uv add jupyterlab
```
