FROM ubuntu:18.04
# installs
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y firefox chromium-browser
# chromium won't run as root. /home is used as userhome by default which firefox doesn't like
RUN useradd -d /home/user -m user
COPY --chmod=755 <<EOT /entrypoint.sh
#!/usr/bin/env sh
firefox http://localhost:3000 &
chromium-browser http://localhost:3000 &
exec bash
EOT
ENTRYPOINT ["/entrypoint.sh"]
USER user