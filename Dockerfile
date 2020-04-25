FROM debian:buster-slim
LABEL maintainer="egdoc.dev@gmail.com"

ENV CERT_DAYS="365"
ENV CERT_COUNTRY="US"
ENV CERT_STATE="New York"
ENV CERT_LOCALITY="Brooklin"
ENV CERT_ORGANIZATION_NAME="Internet Widgits Pty Ltd"
ENV CERT_COMMON_NAME="test.lan"

VOLUME /certs
RUN apt-get update && apt-get -y install openssl

COPY entrypoint.sh /bin
ENTRYPOINT ["entrypoint.sh"]
