FROM state/oraclejre:1.7.0_65

ADD ./confluent.repo /etc/yum.repos.d/

RUN yum update -y -q; yum clean all

RUN rpm --import "http://packages.confluent.io/rpm/1.0/archive.key" && \
    yum install -y confluent-schema-registry && \
    yum clean all

ADD ./schema-registry.properties /etc/schema-registry/schema-registry.properties
ADD ./run.sh /srv/run.sh

CMD ./srv/run.sh
