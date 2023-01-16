[![Docker Image CI](https://github.com/andy5995/slackware-container/actions/workflows/docker.yml/badge.svg)](https://github.com/andy5995/slackware-container/actions/workflows/docker.yml)

# slackware-container

build scripts for a slackware container image

## Note

This repository was forked from
[vbatts/slackware-container](https://github.com/vbatts/slackware-container/)
at
[fork-point](https://github.com/andy5995/slackware-container/tree/fork-point).

The image is pushed to [Docker Hub at
andy5995/slackware](https://hub.docker.com/repository/docker/andy5995/slackware/general).

This is a [template
repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
If you create a repo from this template and want to push directly to your
Docker Hub account, you'll need to follow the [instructions for creating an
access token](https://docs.docker.com/docker-hub/access-tokens/) and update
`.github/workflows/docker.yml`

## Pull

To pull the image without building:

    docker pull andy5995/slackware:15.0

To run the image, see the various options in the [Docker
documentation](https://docs.docker.com/engine/reference/commandline/run/).

## Podman

See the [podman
instructions](https://docs.podman.io/en/latest/Reference.html) if you use
[podman](https://docs.podman.io/en/latest/Reference.html) instead of docker.-

## Build

Currently, using the installer bootstrap, the included `mktar.sh` script can
create an ultra-minimal slackware filesystem. (does not even include pkgtools)

Note: sudo is required because the script uses
[chroot](https://en.wikipedia.org/wiki/Chroot) and downloads files into /tmp.

To build the latest stable version (15.0):

    sudo ./mktar

For 'current':

    sudo RELEASE=slackware64-current ./mktar

A tar file will be created which contains the Slackware filesystem. To create
the docker image, use:

     docker build --build-arg RELEASE=<release> -t <name:tag> .

## Contributing

Please use the [GitHub
flow](https://docs.github.com/en/get-started/quickstart/github-flow).
Individual pull requests should only contain related changes. Making many
unrelated changes in one PR will often cause a delay in having it reviewed and
merged.
