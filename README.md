# Mysql Backup Script

Takes backups on a daily basis and deletes old backups.

## Usage
```sh
    git clone https://github.com/barisesen/mysql-backup.git
    cd mysql-backup
    sudo chmod +x backup.sh
```

- Open backup.sh with text editor and edit configs.
- backup_dir="YOUR_BACKUP_DIR"
- mysql_user="YOUR_MYSQL_USER"
- mysql_password="YOUR_MYSQL_PASSWORD"
- mysql_database="YOUR_MYSQL_DATABASE_NAME"


Open your cron tab.
```sh
    crontab -e
```

Add to the bottom line
```bash
    0 1 * * * /bin/sh /your-install-directory/mysql-backup/backup.sh
```
