# Use the official Ubuntu 20.04 image from the Docker Hub
FROM ubuntu:20.04

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    x11-apps \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    xvfb \
    supervisor \
    dbus-x11 \
    xterm \
    && apt-get clean \
    && apt-get update \
    && apt-get install openjdk-8-jdk -y \
    && apt-get install firefox -y


# Set environment variables
ENV DISPLAY=:99
ENV VNC_PORT=5900

# Create a VNC password
RUN mkdir -p ~/.vnc \
    && x11vnc -storepasswd 1234 ~/.vnc/passwd

# Expose the VNC port
EXPOSE 5900

# Add supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY abevjava_install.jar /root/Download/abevjava_install.jar

# Start the supervisor
CMD ["/usr/bin/supervisord"]

