FROM            openjdk:8-jdk

ARG             MAVEN_VERSION=3.6.3
ARG             MAVEN_HOME="/opt/maven"
ARG             SHA=c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0
ARG             BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries

WORKDIR         ${MAVEN_HOME}
RUN             mkdir -p ${MAVEN_HOME}  ${MAVEN_HOME}/localRepository \
                && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
                && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
                && tar -xzf /tmp/apache-maven.tar.gz -C ${MAVEN_HOME} --strip-components=1 \
                && ls ${MAVEN_HOME} \
		&& mkdir -p /opt/maven/localRepository \
                && rm -f /tmp/apache-maven.tar.gz \
                && ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn


COPY            settings.xml ${MAVEN_HOME}/conf/

USER            root

CMD             [ "mvn -v" ]
