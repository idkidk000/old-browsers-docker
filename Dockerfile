FROM ubuntu:16.04
# installs
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y bash chromium-browser firefox
# chromium won't run as root. /home is used as userhome by default which firefox doesn't like
RUN useradd -d /home/user -m user
COPY --chmod=755 <<EOT /entrypoint.sh
#!/usr/bin/env bash
firefox http://localhost:3000 "\$@" &
chromium-browser --no-sandbox http://localhost:3000 "\$@" &
wait
EOT
ENTRYPOINT ["/entrypoint.sh"]
USER user