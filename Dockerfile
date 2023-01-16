FROM scratch
ARG RELEASE
ADD $RELEASE.tar /
CMD ["/bin/bash","-l"]
