FROM ghcr.io/linuxserver/baseimage-rdesktop-web:3.16

# set version label
ARG BUILD_DATE
ARG VERSION
ARG XFCE_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"


RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    faenza-icon-theme \
    faenza-icon-theme-xfce4-appfinder \
    faenza-icon-theme-xfce4-panel \
    firefox \
    mousepad \
    thunar \
    xfce4 \
    xfce4-terminal && \
  apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    xfce4-pulseaudio-plugin && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
