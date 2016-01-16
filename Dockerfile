FROM technekes/awscli

RUN apk add --update jq && \
    rm /var/cache/apk/*

COPY deploy.sh /tmp/deploy.sh
ENTRYPOINT ["/tmp/deploy.sh"]
