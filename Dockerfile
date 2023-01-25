# dump build stage
FROM postgis/postgis:14-3.2-alpine as dumper

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_USER=geodata
ENV POSTGRES_PASSWORD=geodata
ENV POSTGRES_DATABASE=geodata
ENV PGDATA=/data

# final build stage
FROM postgis/postgis:14-3.2-alpine

ENV POSTGRES_USER=geodata
ENV POSTGRES_PASSWORD=geodata

COPY --from=dumper /var/lib/postgresql/data $PGDATA
COPY ./scripts/base/*.sql /docker-entrypoint-initdb.d/
CMD ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

