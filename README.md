# Mysql Backup Script

Takes backups on a daily basis and deletes old backups.

## Usage
```sh
    git clone https://github.com/barisesen/mysql-backup.git
    cd mysql-backup
    sudo chmod +x backup.sh
```

- Open backup.sh with text editor and edit configs


Open your cron tab.
```sh
    crontab -e
```

Add to the bottom line
```bash
    0 1 * * * /bin/sh /your-instal-directory/mysql-backup/backup.sh
```