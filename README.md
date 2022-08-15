# Easy Peasy Monitoring
Preconfigured Grafana, Prometheus and Exporters docker-compose for faster deployment in production. All you do is to setup the `.env` and the rest is done for you!

### Table of Contents
- [Redis-service](https://github.com/keivanipchihagh/easy-peasy-monitoring#redis-service)
- [PostgreSQL-service](https://github.com/keivanipchihagh/easy-peasy-monitoring#postgresql-service)
- [Prometheus-service](https://github.com/keivanipchihagh/easy-peasy-monitoring#prometheus-service)
- [Grafana-service](https://github.com/keivanipchihagh/easy-peasy-monitoring#grafana-service)

## Redis-service
Running the `redis-service/docker-compose.yml` will create two containers for **Redis-Server** and **Redis-Exporter**.
- The `docker-compose.yml` will set volumns by default to preserve data between restarts which is the recommended bahavior; However, you can comment out the the spesific lines to disable this behavior.
- You also need to create a `.env` file with the following varibles:

```
# Redis Server
REDIS_CONTAINER_NAME=<name-for-redis-containers>
REDIS_HOST=<host>
REDIS_PORT=<unused-port>
REDIS_PASSWORD=<password>

# Redis Exporter
REDIS_EXPORTER_PORT=<unused-port>
```

## PostgreSQL-service
Running the `postgres-service/docker-compose.yml` will create two containers for **Postgres-Server** and **Postgres-Exporter**.
- There are two scripts `data.sql` and `schema.sql` that are executed on startup so that you don't have to manually run SQL scripts (*create tables, insert data, etc*).
- By default, all the data that goes through the created PostgreSQL container are preserved which is the recommended approch; However, you can disable this behavior by commenting out the lines spesified in the `docker-compose.yml` file.
- You also need to create a `.env` file with the following varibles:

```
# Postgres
POSTGRES_CONTAINER_NAME=<name-for-postgres-containers>
POSTGRES_HOST=<host>
POSTGRES_PORT=<unused-port>
POSTGRES_DB=<default-database-to-create>
POSTGRES_SSL=disable
POSTGRES_USER=<username>
POSTGRES_PASSWORD=<password>

# Postgres Exporter
POSTGRES_EXPORTER_PORT=<unused-port>
```

## Prometheus-service
Running the `prometheus-service/docker-compose.yml` will create a single container for **Prometheus-Server**.
- By default, all the data that goes through the created Prometheus container are preserved which is the recommended approch; However, you can disable this behavior by commenting out the line in the `docker-compose.yml` file.
- You also need to create a `.env` file with the following varibles:

```
# Prometheus
PROMETHEUS_CONTAINER_NAME=<name-for-prometheus-container>
PROMETHEUS_PORT=<unused-port>
```
**NOTE**: Use `prometheus-service/prometheus/prometheus.yml` and spesify the Exporter configurations. You can pass list of urls to the *target* parameter.


## Grafana-service
Running the `prometheus-service/docker-compose.yml` will create a single container for **Grafana-server**.
- By default, all the data that goes through the created Grafana container are preserved which is the recommended approch; However, you can disable this behavior by commenting out the line in the `docker-compose.yml` file.
- You can put any dashboard JSON files in the `grafana-service/grafana/dashboards` folder to be loaded on startup. (Check for [dashboards](https://grafana.com/grafana/dashboards))
- You also need to create a `.env` file with the following varibles:

```
# Grafana Server
GRAFANA_CONTAINER_NAME=<name-for-grafana-container>
GF_PORT=<unused-port>
GF_SECURITY_ADMIN_USER=<admin-usernam>
GF_SECURITY_ADMIN_PASSWORD=<admin-password>
GF_USERS_ALLOW_SIGN_UP=<what-new-users-to-create-account?|bool>
GF_AUTH_DISABLE_LOGIN_FORM=false
```

**NOTE #2**: Use `grafana-service/grafana/provisioning/datasources/all.yml` and spesify the DataSources configurations. *Prometheus* is passed by default, but you might want to change the IP/Port. You can also add more datasources.


### *Few Last Words* and *Best Practices*:
- To check for available/unused ports, run: `netstat -tulnap`.
- It's a good practice to name your exporters the same as the container, but with the `-exporter` suffix. This way you can find and manage them much easier when you have many services each with its own Exporters.
- Since each service requires a `.env` to operate, create one in the root directory to serve them all.
