FROM docker.io/archlinux:base-devel

RUN pacman -Syu --noconfirm sudo python

# TODO: create ansible user and allow ansible user to sudo

LABEL archlinux-ansible
