FROM scratch
ARG RELEASE
ADD $RELEASE.tar /

# Tests
RUN /bin/bash -c 'set -e && \
  for file in /usr/bin/{ldd,file,openssl} /usr/sbin/usermod /sbin/route; do \
    test -r $file; \
  done'

CMD ["/bin/bash","-l"]
