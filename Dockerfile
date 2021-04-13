FROM alpine:latest

RUN apk add --no-cache git openssh-client && \
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD *.sh /
ADD config /
RUN mv config /root/.ssh/
RUN chmod 600 /root/.ssh/config
RUN chmod 777 entrypoint.sh
RUN chmod 777 gitee.sh


ENTRYPOINT ["/entrypoint.sh"]
