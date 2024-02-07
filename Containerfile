FROM docker.io/archlinux:base-devel

RUN pacman -Syu --noconfirm --needed systemd sudo python \
    && rm --force --recursive /var/cache/pacman/pkg \
    && useradd --system --create-home --shell /bin/bash ansible \
    && echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible-sudo \
    && useradd --system --create-home --shell /bin/bash aur_builder \
    && echo "aur_builder ALL=(ALL) NOPASSWD: /usr/bin/pacman" > /etc/sudoers.d/aur_builder-pacman

# install nix
RUN pacman -Syu --noconfirm --needed systemd \
    && curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
        --extra-conf "sandbox = false" \
        --init none \
        --no-start-daemon \
        --no-confirm

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
