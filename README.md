# Easy Peasy Deployment
Painless deployment of your favorite technologies in a snap!

## Table of Contents
- [Toolkit Technologies](https://github.com/keivanipchihagh/easy-peasy-deployment#toolkit-technologies)
- [Setup](https://github.com/keivanipchihagh/easy-peasy-deployment#setup)
- [Default Grafana Dashboards](https://github.com/keivanipchihagh/easy-peasy-deployment#default-grafana-dashboards)
- [Contributing](https://github.com/keivanipchihagh/easy-peasy-deployment#contributing)

### Toolkit Technologies
- [Redis](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/redis) - comes with a [redis-exporter](https://github.com/oliver006/redis_exporter) for exposing monitering metrics for _Prometheus_.
- [PostgreSQL](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/postgres) - comes with a [postgres-exporter](https://github.com/prometheus-community/postgres_exporter) for exposing monitoring metrics for _Prometheus_.
- [Prometheus](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/prometheus)
- [Grafana](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/grafana) - comes with a set of preconfigured dashboards.
- [Cadvisor](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/exporters/cadviser)
- [Node-Exporter](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/exporters/node-exporter)
- [Portainer](https://github.com/keivanipchihagh/easy-peasy-deployment/tree/main/portainer) - comes with a [portainer-agent](https://docs.portainer.io/v/ce-2.9/start/install/agent/docker/linux) for exposing Docker information for _Portainer_.
- [Nginx-Proxy-Manager](https://github.com/keivanipchihagh/easy-peasy-deployment/tree/main/nginx-proxy-manager)


### Default Grafana Dashboards
All credits goes to the creators of these dashboards. I just tweeked them a bit to make them easier to work with.
- [Docker and system monitoring](https://grafana.com/grafana/dashboards/893-main/)
- [PostgreSQL Database](https://grafana.com/grafana/dashboards/9628-postgresql-database/)
- [Redis Dashboard for Prometheus Redis Exporter (helm stable/redis-ha)](https://grafana.com/grafana/dashboards/11835-redis-dashboard-for-prometheus-redis-exporter-helm-stable-redis-ha/)

### Setup
1. **Install Docker**: Install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) and [docker-compose]().
2. **Setting up the `.env`**: Create a `.env` file in the root directory (so that all the modules can access it, instead of having a seperate `.env` for each module) that looks something like the following:

  ```python
  # Grafana
  GRAFANA_CONTAINER_NAME=grafana
  GF_PORT=3000
  GF_SECURITY_ADMIN_USER=<username>
  GF_SECURITY_ADMIN_PASSWORD=<password>
  GF_USERS_ALLOW_SIGN_UP=true
  GF_AUTH_DISABLE_LOGIN_FORM=false

  # Prometheus
  PROMETHEUS_CONTAINER_NAME=prometheus
  PROMETHEUS_PORT=9090

  # PostgreSQL
  POSTGRES_CONTAINER_NAME=postgres
  POSTGRES_HOST=<machine-ip>
  POSTGRES_PORT=5432
  POSTGRES_DB=postgres
  POSTGRES_SSL=disable
  POSTGRES_USER=<username>
  POSTGRES_PASSWORD=<password>
  POSTGRES_EXPORTER_PORT=9187

  # Redis
  REDIS_CONTAINER_NAME=redis
  REDIS_HOST=<machine-ip>
  REDIS_PORT=6379
  REDIS_PASSWORD=admin
  REDIS_EXPORTER_PORT=9121

  # Node-Exporter
  NODE_CONTAINER_NAME=node
  NODE_PORT=9100

  # Cadvisor
  CADVISOR_CONTAINER_NAME=cadvisor
  CADVISOR_PORT=8080

  # Portainer
  PORTAINER_CONTAINER_NAME=portainer
  PORTAINER_PORT=9000
  PORTAINER_AGENT_PORT=9001

  # Nginx-Proxy-Manager
  NPM_CONTAINER_NAME=nginx-proxy-manager
  NPM_PORT=81
  ```
  - **Note 1**: most of the variables spesified above have default values in-case you forget to initialize them, such as *names* and *ports*; However, that is not the case with sensitive variables such as *usernames* and *passwords*, for security reasons!
  - **Note 2**: By default, all *exporters* and *agents* that are dependent to a parent container are named with the prefix of the parent container for ease of identification. So just change the parent container's name and the children will follow! (eg. `<parent-container>` & `<parent-container>-exporter`, `<parent-container>` & `<parent-container>-agent`)

3. **Building the toolkit**: Every module comes with a `build.sh`. Just *cd* to the directory, run it with `bash build.sh` and that's it!

### 🤝 Contributing
Since this an ongoing project, you can contribute by adding more exporters or dashboards. You can also add more modules to the project. If you have any questions, feel free to open an issue.
