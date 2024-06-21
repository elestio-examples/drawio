FROM node:lts-slim

LABEL maintainer="JGraph Ltd"

# We don't need the standalone Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Update and install necessary packages
RUN apt-get update \
    && apt-get install -y wget gnupg git curl

# Add Google Chrome signing key and repository
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Update package lists and install Google Chrome and other packages
RUN apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros fonts-kacst fonts-freefont-ttf libxss1 dbus dbus-x11 --no-install-recommends

# Start dbus service
RUN service dbus start

# Install additional fonts
RUN wget http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.8_all.deb \
    && apt install -y --no-install-recommends ./ttf-mscorefonts-installer_3.8_all.deb

# Install minizip
RUN apt install -y --no-install-recommends minizip

# Add pptruser
RUN groupadd -r pptruser && useradd -rm -g pptruser -G audio,video pptruser

# Clone the repository
RUN cd /home/pptruser \
    && git clone https://github.com/jgraph/draw-image-export2.git

# Change ownership of the cloned directory
RUN chown -R pptruser:pptruser /home/pptruser

# Clean up
RUN apt-get remove -y --purge git wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER pptruser

ENV DBUS_SESSION_BUS_ADDRESS autolaunch:

WORKDIR /home/pptruser/draw-image-export2

RUN npm install

EXPOSE 8000

CMD ["npm", "start"]
