FROM gersilex/apcupsd

ENV LOCAL_PORT 3551
RUN apk update && \
    apk add --no-cache \ 
    drill && \
    rm -rf /var/cache/apk/* && rm -rf /tmp/*

****NEEDS WORK****

HEALTHCHECK --interval=20s --timeout=20s --retries=3 --start-period=10s \
    CMD drill -p $LOCAL_PORT @127.0.0.1 || exit 1