FROM alpine:3.7

# Install packages
RUN apk --no-cache add mosquitto mosquitto-clients

# Expose MQTT port
EXPOSE 1883
EXPOSE 9999

ENV PATH /usr/sbin:$PATH

COPY docker-entrypoint.sh /
COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY acls /mosquitto/config/acls
COPY passwd /mosquitto/config/passwd

RUN chmod 777 /docker-entrypoint.sh
RUN chmod 777 /mosquitto/config/mosquitto.conf
RUN chmod 777 /mosquitto/config/acls
RUN chmod 777 /mosquitto/config/passwd

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]

