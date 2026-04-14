# AI Academy - Devcontainer Setup

## Base Image

Uses `mcr.microsoft.com/devcontainers/base:debian` — a minimal Debian image with no Python pre-installed. 
## Features

- **Python 3.12** - installed via the devcontainer Python feature, with JupyterLab enabled. Supports the "Open in JupyterLab" button in GitHub Codespaces UI.
- **Node.js** - required by JupyterLab extensions.
- **Git** - latest version.
- **uv** - fast Python package and project manager, used for dependency management.

## Lifecycle

The `setup.sh` script runs during `updateContentCommand`, which means it re-runs whenever repository content changes (e.g. when `pyproject.toml` or `uv.lock` are updated in a prebuild). It does three things:

1. **`uv sync`** - installs project dependencies from `uv.lock` into a `.venv` environment.
2. **Registers a Jupyter kernel** - makes the uv environment available as "AI Academy (uv)" in JupyterLab's kernel picker.
3. **Sets it as the default kernel** - new notebooks open with the project environment pre-selected.

## Prerequisites

Your `pyproject.toml` must include `ipykernel` as a dependency:

```bash
uv add ipykernel
```

## Opening

From the Codespace, you can work in three ways:

- **VS Code** - opens by default, Jupyter extension uses the registered kernel.
- **JupyterLab** - use the "Open in JupyterLab" button in the Codespace menu. Select the "AI Academy (uv)" kernel.
- **Browser** - standard VS Code in the browser.