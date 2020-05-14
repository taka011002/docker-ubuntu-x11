FROM ubuntu:20.04

WORKDIR usr/workdir

# TZを設定する
ENV TZ Asia/Tokyo
RUN apt-get update \
    && apt-get install -y tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && echo "${TZ}" > /etc/timezone \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# 必要なライブラリのインストール
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install build-essential x11-apps x11-utils x11-xserver-utils dbus-x11 -y \
    && apt-get install gedit -y \
    && apt-get install libgfortran4 -y

COPY commands/ ./commands
RUN chmod +x ./commands
ENV PATH /usr/workdir/commands:$PATH