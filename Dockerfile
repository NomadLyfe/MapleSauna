# FROM openjdk:8u171-jdk-alpine
# RUN apk -U add tini

# 1. Start from a Java 8 JDK image
FROM eclipse-temurin:8-jdk

# 2. Set working dir
WORKDIR /app

# 3. Copy in source, cores, scripts, and wz assets
COPY src                ./src
COPY cores              ./cores
COPY wz                 ./wz
COPY scripts            ./scripts
COPY tools              ./tools
COPY linux-compile.sh   ./linux-compile.sh
COPY linux-launch.sh    ./linux-launch.sh
COPY config.yaml        ./config.yaml
# COPY ./ ./

# 4. Make scripts executable
RUN chmod +x linux-compile.sh linux-launch.sh

# 5. Compile the server
RUN ./linux-compile.sh
# RUN sh ./posix-compile.sh

# ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.6.0/wait /wait
# RUN chmod +x /wait

# 6. Expose ports
EXPOSE 8484 7575 7576 7577

# 7. At container start, run launch script
ENTRYPOINT ["sh", "linux-launch.sh"]
# ENTRYPOINT ["tini", "--"]
# CMD /wait && sh ./posix-launch.sh
