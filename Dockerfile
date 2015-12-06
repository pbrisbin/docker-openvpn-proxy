FROM alpine:latest
MAINTAINER Pat Brisbin <pbrisbin@gmail.com>
RUN apk --update add openvpn privoxy supervisor
EXPOSE 8118
ADD files /
ENTRYPOINT ["/bin/entrypoint"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-n"]
