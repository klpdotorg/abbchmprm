# easymath-akshara
EasyMath Akshara

If this is first run:
docker compose up -d

If you changed versions:
docker compose down -v
docker compose up -d

Project:
http://localhost:8000

phpMyAdmin:
http://localhost:8080

Login:

Username: root

Password: root

If something fails, run:
docker compose ps
docker compose logs web

Run this:
docker logs php_apache

OR for live logs:
docker logs -f php_apache


docker restart php_apache
docker exec -it php_apache cat /var/www/html/.htaccess



docker exec -it php_apache bash

echo "display_errors=On" >> /usr/local/etc/php/conf.d/errors.ini
echo "error_reporting=E_ALL" >> /usr/local/etc/php/conf.d/errors.ini
exit

docker restart php_apache


docker exec -i mysql_db mysql -u root -p mydb < /home/viven/Documents/abbchmprm_db.sql
docker exec -i mysql_db mysql -u root -proot mydb < /home/viven/Documents/abbchmprm_db.sql

docker inspect mysql_db | grep MYSQL

docker exec -it php_apache bash
ls -l /var/www/html/Reports/logfiles
chmod -R 777 /var/www/html/Reports/logfiles


docker exec -it mysql_db mysql -u root -proot
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;



mysql -u root -p abbchmprmdb < schema/push_notification_migration.sql
$cfg_fcm_server_key = 'YOUR_ACTUAL_KEY';
Get it from: Firebase Console → Project Settings → Cloud Messaging → Server key
POST /api/savefcmtoken.php
{ "access_token": "<from login>", "fcm_token": "<from FCM plugin>" }
0 9 * * * php /var/www/html/cron/push_notification_cron.php >> /var/log/push_cron.log 2>&1


crontab -e
*/5 * * * * php /home/viven/Documents/Akshara/abbchmprm/cron/push_notification_cron.php >> /var/log/push_cron.log 2>&1
Breakdown:

*/5 = Every 5 minutes
* = Every hour
* = Every day of month
* = Every month
* = Every day of week
php /path/to/cron/... = Command to run
>> /var/log/push_cron.log 2>&1 = Log output (create this file first)

sudo touch /var/log/push_cron.log
sudo chmod 666 /var/log/push_cron.log

crontab -l

tail -f /var/log/push_cron.log
# or
sudo journalctl -u cron --follow

Interval	Crontab
Every 5 minutes	*/5 * * * *
Every 10 minutes	*/10 * * * *
Every 15 minutes	*/15 * * * *
Every 30 minutes	*/30 * * * *
Every hour	0 * * * *
Every day at 9 AM	0 9 * * *
Every Monday at 8 AM	0 8 * * 1

docker-compose up -d --force-recreate cron

# Check if cron container is running
docker ps | grep php_cron

# View cron logs
docker logs php_cron

# Or stream logs in real-time
docker logs -f php_cron

# View the cron log file
cat cron/push_cron.log

# Or stream it
tail -f cron/push_cron.log

docker-compose exec cron php /var/www/html/cron/push_notification_cron.php
docker-compose exec web php /var/www/html/cron/push_notification_cron.php

docker-compose exec web php /var/www/html/push/test_fcm.php
docker-compose exec cron php /var/www/html/push/test_fcm.php

FirebaseMessaging.getInstance().getToken()
    .addOnCompleteListener(task -> {
        if (task.isSuccessful()) {
            String token = task.getResult();
            Log.d("FCM Token", token);
        }
    });

docker compose exec web php /var/www/html/push/test_fcm.php

Sending test notification to FCM token: cHjG8k9nM2pL5qR7sT...

✅ SUCCESS! Notification sent

Response: {
  "name": "projects/building-blocks-b0332/messages/7329484..."
}

❌ FAILED! Error: [error message]