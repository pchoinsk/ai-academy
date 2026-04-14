# Python Image + Python Feature Conflict
Using `mcr.microsoft.com/devcontainers/python:3.13` with the Python feature's `installJupyterlab: true` fails because 
the feature targets the system Debian Python (at `/usr/bin/python3`), not the image's Python 3.13 (at `/usr/local/python/`). 
The system Python is marked as externally managed (PEP 668) and rejects pip install, so `JupyterLab` installation crashes 
the entire container build.

### Alternatives
-  **Debian base image (recommended)**. Use base:debian and let the Python feature handle everything. JupyterLab 
installs cleanly, and the "Open in JupyterLab" button in GitHub UI works out of the box.
- Python image + manual JupyterLab install. Keep the Python image, skip the Python feature, and install JupyterLab 
yourself via `setup.sh`. However, the "Open in JupyterLab" button in GitHub UI likely won't work - you'd need to start
JupyterLab manually from the terminal.


> **_NOTE:_** <p>If JupyterLab is not needed then Python image is perfectly fine to use. Just remove python feature
> from devcontainer.json. The `setup.sh` is not needed either. You can use `updateContentCommand` or `postCreateCommand` 
> to install any additional dependencies you need. The Python image will still provide a consistent Python environment 
> and all the benefits of the devcontainer setup, just without JupyterLab.
