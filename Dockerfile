FROM java:openjdk-8u111-jdk-alpine

ADD bootstrap.sh /
ADD src /src

ENTRYPOINT ["/bootstrap.sh"]
