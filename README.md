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


Rule	Tone	Example (English)
inactive_3days	Gentle nudge	"It's been 3 days! Come back and keep your math skills sharp."
inactive_7days	Stronger reminder	"A whole week! Come back — your streak is waiting!"
inactive_14days	Urgent call to action	"It's been 2 weeks! Come back today — your math talent is waiting to shine!"

Rule	Trigger	Throttle	Sent
inactive_7days	No login for 7+ days	Once per 7 days	Repeatedly
mid_game_3days	Last game 1–3 days ago	Once per 24 hrs	Repeatedly
reward_5games	Crossed 5 total games	Never re-sent	Once ever
daily_reminder	No game in last 24 hrs (but active within 7 days)	Once per 24 hrs	Repeatedly


docker-compose exec db mysql -u root -proot mydb < /var/www/html/schema/push_notification_messages_migration.sql

docker compose down
docker compose build cron
docker compose up -d


-- Insert a test child that triggers 'inactive_3days' rule
-- (last_login set to 4 days ago, within the 3-6 day range)
INSERT INTO child_tbl (child_name, deviceid, id_grade, school_type,	geo, district, id_language, organization,fcm_token, last_login, created_datetime)
VALUES (
    'Test Child',
    'test-device-001',
    1,                          -- any valid grade id
    1,
    '77.580643,12.972442',
    'Bengaluru',
    3,                          -- English
    'My ORG',
    'd1WA4L75QqWL-TCRvCNQfb:APA91bGp-ZyulBfqSFfn9uV2UEtgjUhgqd916zgP9KKH1mYMWti3Qih2tWpXsym-0XLL9USfL2qMalztisQTUPDez2yR74HjMD5nVBe-YaDhZIfSWQq4qOw',      -- paste your actual FCM token
    DATE_SUB(NOW(), INTERVAL 5 DAY),  -- 4 days ago → triggers inactive_3days
    NOW()
);

-- Run this after each cron fire to allow the next one
DELETE FROM push_notification_log_tbl
WHERE id_child = (SELECT id_child FROM child_tbl WHERE deviceid = 'test-device-001');

daily_reminder

-- Set last game session to 2 days ago (within 7 days but not in last 24h)
INSERT INTO game_play_tbl (id_game_play,id_game, id_child, start_time)
VALUES (
    'CALhplpiqkzciro',
    'NSNG1.1',
    (SELECT id_child FROM child_tbl WHERE deviceid = 'test-device-001'),
    DATE_SUB(NOW(), INTERVAL 2 DAY)
    
);

-- Also set last_login to recently so inactive rules don't fire instead
UPDATE child_tbl
SET last_login = DATE_SUB(NOW(), INTERVAL 1 DAY)
WHERE deviceid = 'test-device-001';

-- Reset throttle
DELETE FROM push_notification_log_tbl
WHERE id_child = (SELECT id_child FROM child_tbl WHERE deviceid = 'test-device-001')
  AND notification_type = 'daily_reminder';



