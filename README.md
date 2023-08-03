# container-archlinux-ansible

An Archlinux container used for testing Ansible roles.
Can run with systemd as init.

## Podman / Docker example

```bash
# Create the container without systemd
podman run --interactive --tty ghcr.io/stegmannb/container-archlinux-ansible:latest
```

## Podman / Docker systemd example

```bash
# Create the container with systemd
podman run --detach --entrypoint /sbin/init --cap-add SYS_ADMIN --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --systemd=true ghcr.io/stegmannb/container-archlinux-ansible:latest
# Log into the container
podman exec --latest --interactive --tty /bin/bash
# Or use short flags
podman exec -itl /bin/bash
```

## Molecule systemd example

```yaml
driver:
  name: containers

platforms:
  - name: molecule-archlinux-systemd
    image: ghcr.io/stegmannb/container-archlinux-ansible:latest
    groups:
      - archlinux
    command: /sbin/init
    tmpfs:
      - /run
      - /tmp
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```

## Molecule example

```yaml
driver:
  name: containers

platforms:
  - name: molecule-archlinux-systemd
    image: ghcr.io/stegmannb/container-archlinux-ansible:latest
    groups:
      - archlinux
```

## Ansible systemd example

```yaml
- name: Create Archlinux test container
  containers.podman.podman_container:
    name: test-archlinux
    image: ghcr.io/stegmannb/container-archlinux-ansible:latest
    groups:
      - archlinux
    command: /sbin/init
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    capabilities:
      - SYS_ADMIN
```

## Ansible example

```yaml
- name: Create Archlinux test container
  containers.podman.podman_container:
    name: test-archlinux
    image: ghcr.io/stegmannb/container-archlinux-ansible:latest
    groups:
      - archlinux
```
