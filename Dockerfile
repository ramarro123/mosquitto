FROM alpine:edge
LABEL Maintainer="Tim de Pater <code@trafex.nl>" \
      Description="Lightweight Mosquitto MQTT server based on Alpine Linux."

# Install packages
RUN apk --no-cache add mosquitto mosquitto-clients

# Expose MQTT port
EXPOSE 1883

ENV PATH /usr/sbin:$PATH

COPY docker-entrypoint.sh /

RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]

