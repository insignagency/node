#!/bin/sh
if [ "${USER_CURRENT_ID}" != 1000 ]; then
	usermod -u ${USER_CURRENT_ID} node
	chown node:node /home/node
fi
if [ "${USER_CURRENT_GID}" != 1000 ]; then
	 groupmod -g ${USER_CURRENT_GID} node
	 chown node:node /home/node
fi

docker-entrypoint.sh "$@"

