FROM eclipse-temurin:21.0.7_6-jdk-noble

ARG USERNAME=ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y build-essential curl git unzip wget 

WORKDIR /root

ARG GRADLE_VERSION
ENV GRADLE_HOME=/opt/gradle

RUN wget -nv -O gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
  && unzip gradle.zip \
  && rm gradle.zip \
  && mv "./gradle-${GRADLE_VERSION}" ${GRADLE_HOME}

ENV PATH=${PATH}:${GRADLE_HOME}/bin

USER ${USERNAME}
WORKDIR /home/${USERNAME}

COPY --chown=${USERNAME}:${USERNAME} ./Makefile /home/${USERNAME}

RUN mkdir -p /home/${USERNAME}/.gradle

ENTRYPOINT [ "make" ]
