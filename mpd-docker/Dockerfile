FROM ubuntu:xenial
RUN apt-get update && apt-get upgrade -y \
&& apt-get install mpd mpc -y \
&& apt-get clean

COPY mpd.conf /etc/mpd.conf
COPY entry.sh /
EXPOSE 6600
CMD ["/entry.sh"]
