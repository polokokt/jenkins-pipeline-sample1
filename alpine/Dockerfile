FROM alpine:latest

RUN apk update && apk add --no-cache \
    openssh \
    bash \
    python3 \
    py3-pip \
    mariadb-client \
    aws-cli \
    && pip install --upgrade pip --break-system-packages \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /run/sshd 

RUN id remote_user || adduser -D -s /bin/bash remote_user \
    && echo "remote_user:1234" | chpasswd \
    && mkdir -p /home/remote_user/.ssh \
    && chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user/.ssh \
    && chmod 600 /home/remote_user/.ssh/authorized_keys

EXPOSE 22

CMD ["/bin/sh", "-c", "ssh-keygen -A && /usr/sbin/sshd -D"]
