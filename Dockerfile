FROM alpinelinux/build-base:latest AS builder
RUN sudo apk —-no-cache update && sudo apk —no-cache upgrade
WORKDIR /home/buildozer
ADD . .
RUN sudo chown -R buildozer .
RUN ./build.sh
RUN cd packages && mv buildozer fidonet

FROM alpine:3.11.5
RUN adduser fido -G wheel -h /opt/fido -u 1000 -D

WORKDIR /opt/fido
COPY --from=builder --chown=fido:wheel /home/buildozer/.abuild .abuild
COPY --from=builder --chown=fido:wheel /home/buildozer/packages packages

RUN printf "/opt/fido/packages/fidonet\n$(cat /etc/apk/repositories)\n" > /etc/apk/repositories
RUN cp .abuild/*.pub /etc/apk/keys

RUN apk —-no-cache update && apk --no-cache upgrade

RUN apk —-no-cache addluit luit-doc husky-hpt binkd golded-plus golded-plus-doc husky-fidoconf husky-lib

USER fido
ENTRYPOINT ["/bin/ash"]


