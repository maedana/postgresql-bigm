FROM postgres:17
MAINTAINER aki77 <aki77@users.noreply.github.com>

RUN apt update
RUN apt install -y postgresql-server-dev-17 make gcc wget libicu-dev

RUN wget https://github.com/pgbigm/pg_bigm/archive/refs/tags/v1.2-20250903.tar.gz
RUN tar zxf v1.2-20250903.tar.gz
RUN cd pg_bigm-1.2-20250903 && make USE_PGXS=1 && make USE_PGXS=1 install

RUN echo shared_preload_libraries='pg_bigm' >> /usr/share/postgresql/postgresql.conf.sample

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
