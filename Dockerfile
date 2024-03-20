FROM debian:12
LABEL authors="Sudiro"

#ENTRYPOINT ["top", "-b"]

# Set environment variables
#ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
ENV JBOSS_HOME=/opt/jboss

# initial package
RUN mkdir -p /etc/apt/keyrings

# Install OpenJDK and other required packages
RUN apt-get update && \
    apt-get install -y wget && \
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc && \
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb  \
    $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-8-jdk wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install JBoss
WORKDIR /opt
RUN wget -q https://download.jboss.org/wildfly/17.0.1.Final/wildfly-17.0.1.Final.tar.gz && \
    tar -xzf wildfly-17.0.1.Final.tar.gz && \
    rm wildfly-17.0.1.Final.tar.gz && \
    mv wildfly-17.0.1.Final $JBOSS_HOME

# Expose ports
EXPOSE 8080 9990

# Start JBoss
CMD ["/opt/jboss/bin/standalone.sh", "-b", "0.0.0.0"]