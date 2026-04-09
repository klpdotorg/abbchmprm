# EasyMath Akshara

A PHP-based backend API for an educational mathematics gaming platform for children, built by [Akshara Foundation](https://akshara.org.in/). The app delivers math learning games across two modes — **Challenge Mode (CHM)** and **Problem-solving Mode (PRM)** — with multi-language support, push notifications, and analytics.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Language | PHP 7.4 |
| Web Server | Apache 2.4 |
| Database | MySQL 5.7 |
| Containerization | Docker & Docker Compose |
| Push Notifications | Firebase Cloud Messaging (FCM v1) |
| Geocoding | Google Maps API / MapMyIndia |
| External Sync | EkStep Telemetry API |

---

## Project Structure

```
abbchmprm/
├── api/                    # REST API endpoints
├── app/
│   ├── boot/               # Bootstrap & autoloader
│   └── classes/            # Core service classes
├── assets/
│   └── userprogress/       # User Progress sub-module (standalone mini-app)
│       ├── api/
│       │   ├── getuserprogress.php   # Returns full per-child progress breakdown
│       │   └── getchild.php          # Retrieve child profile
│       ├── app/
│       │   ├── boot/                 # Bootstrap & autoloader
│       │   └── classes/              # DAO and DB handler classes
│       ├── config/
│       │   ├── appconfig.php         # App config (copy from appconfig.php.example)
│       │   ├── dbconfig.php          # DB credentials (copy from dbconfig.php.example)
│       │   └── appglobals.php        # Global constants
│       ├── errorhandler/             # Error handling
│       ├── logging/                  # Logging utilities
│       ├── logfiles/                 # Log output
│       ├── objects/                  # Data objects (child, userprogress)
│       ├── scripts/                  # JS utilities
│       ├── servicefunctions/         # Business logic
│       ├── utils/                    # Utility helpers
│       └── .htaccess
├── avatarpics/             # Profile picture storage
├── config/
│   ├── appconfig.php       # App configuration (copy from appconfig.php.example)
│   └── dbconfig.php        # DB credentials (copy from dbconfig.php.example)
├── cron/                   # Scheduled push notification jobs
├── errorhandler/           # Error handling utilities
├── ekstepsync/             # EkStep telemetry sync
├── logfiles/               # Application logs
├── logging/                # Logging utilities
├── objects/                # Data object classes
├── push/                   # FCM helpers
├── Reports/                # Analytics & reporting module
├── schema/                 # Database schema & migrations
├── servicefunctions/       # Core business logic
├── scripts/                # Utility scripts
├── testclient/             # Testing utilities
├── utils/                  # Utility functions
├── docker-compose.yml
└── .htaccess
```

---

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) and Docker Compose

### 1. Configure the application

Copy the example config files and fill in your credentials:

```bash
cp config/dbconfig.php.example config/dbconfig.php
cp config/appconfig.php.example config/appconfig.php
cp Reports/config/dbconfig.php.example Reports/config/dbconfig.php
```

Edit each file with your actual database credentials, API keys, and Firebase settings.

### 2. Add Firebase Service Account

Download your Firebase service account JSON from:
> Firebase Console → Project Settings → Service Accounts → Generate new private key

Place it in the `cron/` directory and update `$cfg_fcm_service_account_json_path` in `config/appconfig.php`.

### 3. Start the application

**First run:**
```bash
docker compose up -d
```

**After changing Docker versions or config:**
```bash
docker compose down -v
docker compose up -d
```

### 4. Load the database schema

```bash
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/abbchmprmdb_latest_schema.sql
```

Apply incremental migrations if needed (in order):
```bash
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/push_notification_migration.sql
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/push_notification_messages_migration.sql
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/push_notification_log_columns_migration.sql
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/add_missing_fk_constraints.sql
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/add_push_notification_log_report.sql
docker exec -i mysql_db mysql -u root -proot abbchmprmdb < schema/optimize_indexes.sql
```

---

## Access Points

| Service | URL | Credentials |
|---------|-----|-------------|
| App / API | http://localhost:8000 | — |
| Reports | http://localhost:8000/Reports/ | — |
| phpMyAdmin | http://localhost:8080 | root / root |

---

## API Reference

All endpoints accept `POST` requests with JSON body.

### Authentication & User Management

| Endpoint | Description |
|----------|-------------|
| `POST /api/register.php` | Register a new child |
| `POST /api/login.php` | Login with name & device ID |
| `POST /api/getaccesstoken.php` | Get access token |
| `POST /api/getchild.php` | Retrieve child profile |
| `POST /api/updateprofile.php` | Update profile |
| `POST /api/updateavatarpic.php` | Update avatar (base64) |
| `POST /api/getavatarpic.php` | Retrieve avatar |

### Game Data

| Endpoint | Description |
|----------|-------------|
| `POST /api/rxabbchmgetgamemasterdata.php` | Get available CHM games |
| `POST /api/txabbchmgameplay.php` | Submit CHM game session |
| `POST /api/txabbchmgameplaydetail.php` | Submit CHM game session details |
| `POST /api/txabbprmgameplay.php` | Submit PRM game session |
| `POST /api/txabbprmgameplaydetail.php` | Submit PRM game session details |

### Scoring

| Endpoint | Description |
|----------|-------------|
| `POST /api/txabbchmwalletscore.php` | Update wallet score (CHM) |
| `POST /api/rxabbchmgetwalletscore.php` | Get wallet score (CHM) |

### User Progress (sub-module at `/assets/userprogress/`)

| Endpoint | Description |
|----------|-------------|
| `POST /assets/userprogress/api/getuserprogress.php` | Returns full progress breakdown for a child (PRM & CHM scores across Number Sense, Number Operations, Measurement, and all sub-domains) |
| `POST /assets/userprogress/api/getchild.php` | Retrieve child profile |

**Request body:**
```json
{ "name": "<child_name>", "deviceid": "<device_id>" }
```

### Notifications & Sync

| Endpoint | Description |
|----------|-------------|
| `POST /api/savefcmtoken.php` | Save FCM token for push notifications |
| `POST /api/tracknotificationopen.php` | Track notification opens |
| `POST /api/syncToEkStep.php` | Sync gameplay data to EkStep |
| `POST /api/txabbprmekstepevents.php` | Push events to EkStep |

---

## Push Notifications

The cron container runs `cron/push_notification_cron.php` on a schedule to send Firebase push notifications. Supported notification types:

| Rule | Trigger | Throttle |
|------|---------|---------|
| `inactive_3days` | No login for 3–6 days | Once per 7 days |
| `inactive_7days` | No login for 7–13 days | Once per 7 days |
| `inactive_14days` | No login for 14–29 days | Once per 14 days |
| `inactive_1month` | No login for 1–2 months | Once per 30 days |
| `inactive_2months` | No login for 2–3 months | Once per 30 days |
| `inactive_3months` | No login for 3+ months | Once per 30 days |
| `reward_5games` | Crossed 5 total games | Once ever |
| `daily_reminder` | No game in last 24 hrs (active within 7 days) | Once per 24 hrs |
| `mid_game_3days` | Last game 1–3 days ago | Once per 24 hrs |

**Supported languages:** English, Hindi, Kannada, Tamil, Telugu, Marathi, Gujarati, Odia, Urdu

### Test push notifications manually

```bash
docker compose exec web php /var/www/html/push/test_fcm.php
```

### View cron logs

```bash
docker logs -f php_cron
tail -f cron/push_cron.log
```

### Rebuild cron container after changes

```bash
docker compose down
docker compose build cron
docker compose up -d
```

---

## Debugging

Enable PHP error display inside the container:

```bash
docker exec -it php_apache bash -c "echo 'display_errors=On' >> /usr/local/etc/php/conf.d/errors.ini && echo 'error_reporting=E_ALL' >> /usr/local/etc/php/conf.d/errors.ini"
docker restart php_apache
```

View Apache logs:

```bash
docker logs php_apache
docker logs -f php_apache
```

Check container status:

```bash
docker compose ps
docker compose logs web
```

Open a shell inside the container:

```bash
docker exec -it php_apache bash
```

---

## Database Access

Connect to MySQL directly:

```bash
docker exec -it mysql_db mysql -u root -proot
```

Grant full privileges (if needed):

```sql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

Fix log file permissions:

```bash
docker exec -it php_apache bash -c "chmod -R 777 /var/www/html/Reports/logfiles"
```

---

## Supported Languages

| ID | Language |
|----|----------|
| 1 | Tamil |
| 2 | Kannada |
| 3 | English |
| 4 | Hindi |
| 5 | Odia |
| 6 | Gujarati |
| 7 | Marathi |
| 8 | Telugu |
| 9 | Urdu |