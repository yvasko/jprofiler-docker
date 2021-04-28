FROM openjdk:11-jdk-slim

# install wget command
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

# install jprofiler
RUN wget https://download-gcdn.ej-technologies.com/jprofiler/jprofiler_linux_12_0_2.tar.gz -P /tmp/ && \
tar -xzf /tmp/jprofiler_linux_12_0_2.tar.gz -C /usr/local &&\
rm /tmp/jprofiler_linux_12_0_2.tar.gz

COPY build/libs/*.jar app.jar

# standard command
# CMD ["java", "-jar", "app.jar"]

# command with profiling option on
CMD ["java", "-Xshare:off", "-agentpath:/usr/local/jprofiler12.0.2/bin/linux-x64/libjprofilerti.so=port=8849,nowait", "-jar", "app.jar"]

