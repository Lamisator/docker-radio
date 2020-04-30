FROM ubuntu:xenial
RUN apt-get update && apt-get upgrade -y \
 && apt-get install icecast2 sudo -y \
 && apt-get clean

COPY entry.sh /entry.sh

VOLUME ["/etc/icecast2/"]

EXPOSE 8000

CMD ["/entry.sh"]
