# Use the newly built alpine-custom image
FROM alpine-custom:3.21.3  

# Install Nginx & PHP-FPM
RUN apk update && apk add --no-cache \
    nginx \
    php \
    php82-fpm \
    php82-cli \
    php82-mysqli \
    php82-curl \
    php82-mbstring \
    php82-json \
    php82-openssl \
    php82-session \
    supervisor \
    bash \
    && rm -rf /var/cache/apk/*

# Ensure PHP-FPM is installed and available
RUN ln -s /usr/sbin/php-fpm82 /usr/sbin/php-fpm || true

# Verify PHP-FPM installation
RUN php-fpm82 -v

#check if the www directory exists
RUN mkdir -p /var/www/html

RUN ssh-keygen -A

# Copy configuration files
COPY php-fpm/www.conf /etc/php-fpm.d/www.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY www/index.php /var/www/html/index.php
COPY supervisor/supervisord.conf /etc/supervisord.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Replace UNIX socket with TCP in Nginx config
RUN sed -i 's|fastcgi_pass unix:/var/run/php-fpm.sock|fastcgi_pass 127.0.0.1:9000|' /etc/nginx/conf.d/default.conf

# Expose port 80 443 for HTTP and HTTPS
EXPOSE 80 443

# Start Supervisor to manage both Nginx & PHP-FPM
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

