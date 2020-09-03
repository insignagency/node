ARG NODE_VERSION=14

FROM node:${NODE_VERSION}-alpine

LABEL Damien DUBOEUF <duboeuf.damien@gmail.com>

RUN apk add  --no-cache \
    git shadow \
    && rm -rf /var/cache/apk/* 

ENV USER_CURRENT_ID=1000
ENV USER_CURRENT_GID=1000

COPY docker-user-entrypoint.sh /docker-user-entrypoint.sh
RUN mkdir /app && chown node: /app
WORKDIR /app
ENTRYPOINT ["/docker-user-entrypoint.sh"]
CMD ["node"]

