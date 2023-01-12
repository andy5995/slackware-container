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

## build

Currently, using the installer bootstrap, the mkimage-slackware can create an
ultra-minimal slackware filesystem. (does not even include pkgtools)

If you have [podman](https://github.com/containers/libpod/tree/master/cmd/podman) installed (the is an [SBo build](https://slackbuilds.org/repository/14.2/system/podman/)):

```shell
CRT="sudo podman" make image
```

Then you will be able to run:

```shell
sudo podman run -i -t $USER/slackware-base /bin/sh
```

_(this also can be built and run with docker as well. If you build with one, you'll have to push your container build to a container registry before you can pull and run with the other)_

(This will be the environment to build out the Dockerfile from)
(( see http://docs.docker.com/reference/builder/ for more info on that ))


To build alternate versions of slackware, pass gnu-make the RELEASE variable, like:

   make image RELEASE=slackware64-15.0

A tar file will be created which contains the Slackware filesystem. To create
an image from that manually, see the [Docker import
reference](https://docs.docker.com/engine/reference/commandline/import/);
alternatively, to create an image using the Dockerfile in the repo root, use:

    docker build --build-arg RELEASE=<release> -t <name:tag> .

To build and test say slackware64-current in a docker container:

    make run-current

or

    docker run -it andy5995/slackware


Will pull down this image for testing.

## Contributing

Please use the [GitHub
flow](https://docs.github.com/en/get-started/quickstart/github-flow)

## License

Copyright (c) 2013, Vincent Batts <vbatts@hashbangbash.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
