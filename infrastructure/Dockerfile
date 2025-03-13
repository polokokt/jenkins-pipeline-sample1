FROM jenkins/jenkins:lts 

USER root

RUN [ -f /etc/apt/sources.list ] && sed -i 's|http://deb.debian.org|http://mirror.hetzner.de|g' /etc/apt/sources.list || true

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ansible \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins

# Check the installation
RUN python3 --version && pip3 --version && ansible --version && docker --version && docker-compose --version

USER jenkins