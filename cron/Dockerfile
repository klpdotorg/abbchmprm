FROM php:7.4-cli

# Install PHP extensions once at build time
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install cron
RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/*

# Add the crontab (use full path to php - cron runs with minimal PATH)
RUN echo 'PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin' > /etc/cron.d/push-notifications && \
    echo '*/5 * * * * root /usr/local/bin/php /var/www/html/cron/push_notification_cron.php >> /var/www/html/cron/push_cron.log 2>&1' >> /etc/cron.d/push-notifications && \
    chmod 0644 /etc/cron.d/push-notifications

# Create the log file so tail -f doesn't fail
RUN touch /var/www/html/cron/push_cron.log || true

CMD ["bash", "-c", "touch /var/www/html/cron/push_cron.log && service cron start && tail -f /var/www/html/cron/push_cron.log"]
