# Version majeure du serveur à sauvegarder. pg_dump refuse de dumper un serveur
# plus récent que lui (« aborting because of server version mismatch »), donc le
# client suit le serveur : l'image officielle postgres:<version> embarque le bon.
# Render transmet la variable d'environnement POSTGRES_VERSION comme build arg.
ARG POSTGRES_VERSION=18
FROM postgres:${POSTGRES_VERSION}-alpine

RUN apk add --no-cache aws-cli bash gzip

WORKDIR /scripts
COPY backup.sh .
ENTRYPOINT [ "/scripts/backup.sh" ]
