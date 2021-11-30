FROM postgres:latest
COPY *.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
# It does not create the IP address so it cannot boot.
# CMD ['postgres']