FROM docker.io/archlinux:base-devel

RUN pacman -Syu --noconfirm sudo python ansible sshpass \
    && useradd --system --create-home --shell /bin/bash ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible-sudo \
    && useradd --system --create-home --shell /bin/bash aur_builder \
    && echo "aur_builder ALL=(ALL) NOPASSWD: /usr/bin/pacman" > /etc/sudoers.d/aur_builder-pacman
