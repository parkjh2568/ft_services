FROM alpine:3.12.0

RUN apk update \
		&& apk --update --no-cache add \
                influxdb

EXPOSE 8086
#기본세팅으로 시작.
CMD /usr/sbin/influxd -config /etc/influxdb.conf