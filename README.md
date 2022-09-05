# Easy Peasy Monitoring
Preconfigured Grafana, Prometheus and Exporters docker-compose for faster deployment in production. All you do is to setup the `.env` and the rest is done for you!

**NOTE:** The `.env` is not ignored in this repo and you can easily see what is going on, so does everyone else! Please do add the `.env` to your `.gitignore` file.

### Modules
- [Redis-service](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/redis-service): Redis Cache database and its exporter
- [PostgreSQL-service](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/postgres-service): PostgreSQL Database and its exporter
- [Prometheus-service](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/prometheus-service): Pormetheus Server
- [Grafana-service](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/grafana-service): Grafana Server
- [Cadvisor-exporter](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/exporters/cadviser): Cadvisor exporter
- [Node-exporter](https://github.com/keivanipchihagh/easy-peasy-monitoring/tree/main/exporters/node-exporter): Node exporter


### Used Dashboards
All credits goes to the creators of these dashboards. I just tweeked them a bit to make them easier to work with
- [Docker and system monitoring](https://grafana.com/grafana/dashboards/893-main/)
- [PostgreSQL Database](https://grafana.com/grafana/dashboards/9628-postgresql-database/)
- [Redis Dashboard for Prometheus Redis Exporter (helm stable/redis-ha)](https://grafana.com/grafana/dashboards/11835-redis-dashboard-for-prometheus-redis-exporter-helm-stable-redis-ha/)

### 🤝 Contributing
Since this an ongoing project, you can contribute by adding more exporters or dashboards. You can also add more modules to the project. If you have any questions, feel free to open an issue.