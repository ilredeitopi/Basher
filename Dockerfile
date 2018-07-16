FROM gradle:jdk10
LABEL maintainer="Tommaso Dal Sasso"

RUN mkdir build app
WORKDIR build
ADD --chown=gradle src ./src/
ADD --chown=gradle build.gradle settings.gradle ./
RUN gradle assemble

WORKDIR ../app
RUN tar -xf ../build/build/distributions/basher-*.tar

ENTRYPOINT exec basher-0.1.0/bin/basher

# docker build -t basher:latest .
# docker run --rm -it basher
