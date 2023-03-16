FROM node:18.15.0-alpine3.17

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PROXY_DIR=/whistle

WORKDIR ${PROXY_DIR}

COPY ./whistle-init.sh ${PROXY_DIR}/whistle-init.sh

RUN echo -e "https://mirrors.ustc.edu.cn/alpine/v3.17/main\nhttps://mirrors.ustc.edu.cn/alpine/v3.17/community" > /etc/apk/repositories \
  && apk update -f \
  && apk upgrade \
  && apk --no-cache add -f bash \
  coreutils \
  moreutils \
  git \
  vim \
  wget \
  curl \
  nano \
  tzdata \
  perl \
  openssl \
  ca-certificates \
  && rm -rf /var/cache/apk/* \
  && npm install -g whistle --registry=https://registry.npm.taobao.org \ 
  && chmod 777 ${PROXY_DIR}/whistle-init.sh

EXPOSE 8899-8929 9006-9026
ENTRYPOINT ["sleep", "36000"]