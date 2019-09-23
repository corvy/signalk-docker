FROM alpine:3.10.2

# Install needed tools and requirements, also for installation

RUN apk --update --no-cache add \
  bash build-base make gcc g++ python linux-headers udev clang nodejs npm openssh && \

  # Upgrade to latest NPM
  npm install -g npm@latest && \
  
  # Install signal-server
  npm install -g --unsafe-perm --build-from-source signalk-server && \

  # Remove unneeded software after install
  apk del build-base make gcc g++ linux-headers && \

  # Create settings directory
  mkdir /config

CMD /usr/bin/signalk-server -c /config
