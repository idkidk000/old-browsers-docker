# Run old Firefox and Chromium on Linux with Docker

- Builds an Ubuntu 18.04 image with 5-year-old Firefox and Chromium
- Grants X11 permissions to docker (still works under Wayland)
- Runs the image with host networking so it can access localhost
- Revokes permissions

### To use
`./run.sh`