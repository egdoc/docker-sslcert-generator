FROM debian:buster-slim
LABEL maintainer="egdoc.dev@gmail.com"

ENV DAYS="365"
ENV COUNTRY="US"
ENV STATE="New York"
ENV LOCALITY="Brooklin"
ENV ORGANIZATION_NAME="Internet Widgits Pty Ltd"
ENV COMMON_NAME="test.lan"

VOLUME /certs
RUN apt-get update && apt-get -y install openssl

COPY entrypoint.sh /bin
ENTRYPOINT ["entrypoint.sh"]
