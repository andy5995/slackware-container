FROM alpine
ARG RELEASE
COPY $RELEASE.tar .
WORKDIR /slackware
RUN tar xf /$RELEASE.tar

FROM scratch
COPY --from=0 /slackware /
CMD ["/bin/bash","-l"]
