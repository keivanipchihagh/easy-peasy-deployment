FROM bitnami/spark:3.3

# Install curl
USER root
RUN install_packages curl
USER 1001

# Trino JDBC driver
RUN curl https://repo1.maven.org/maven2/io/trino/trino-jdbc/396/trino-jdbc-396.jar \
    --output /opt/bitnami/spark/jars/trino-jdbc-396.jar

# PostgreSQL JDBC driver
RUN curl https://jdbc.postgresql.org/download/postgresql-42.5.0.jar \
    --output /opt/bitnami/spark/jars/postgresql-42.5.0.jar