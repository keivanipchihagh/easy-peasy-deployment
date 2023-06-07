FROM apache/airflow:2.6.0rc5-python3.10

USER root

# Install OpenJDK-11
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y ant
RUN apt-get clean
RUN apt-get install curl

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN mkdir -p /opt/airflow/spark/jars
RUN export JAVA_HOME

# Trino JDBC driver
# RUN curl https://repo1.maven.org/maven2/io/trino/trino-jdbc/396/trino-jdbc-396.jar \
#     --output /opt/airflow/spark/jars/trino-jdbc-396.jar

# PostgreSQL JDBC driver
RUN curl https://jdbc.postgresql.org/download/postgresql-42.5.0.jar \
    --output /opt/airflow/spark/jars/postgresql-42.5.0.jar

# Must use 'airflow' user to install PIP packages
USER airflow

# Install requirements
COPY requirements.txt /
RUN --mount=type=cache,target=/root/.cache \
	pip install -r /requirements.txt