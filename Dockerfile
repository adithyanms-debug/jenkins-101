FROM jenkins/jenkins:lts-jdk17
USER root

# Install required system tools
RUN apt-get update && apt-get install -y lsb-release python3 python3-pip python3-venv curl

# Download the Docker repository signing key
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

# Add the Docker apt repository for the detected Debian release
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update indexes and install the Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"





