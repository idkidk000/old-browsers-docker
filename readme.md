# Run old browsers on Linux with Docker

- Builds an Ubuntu 18.04 image with 5-year-old Firefox and Chromium
- Grants X11 permissions to docker (still works under Wayland)
- Runs the image with host networking so it can access localhost
- Revokes permissions

### Bugs
`chromium-browser` currently fails to start with `Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted`

### To use
`./run.sh`