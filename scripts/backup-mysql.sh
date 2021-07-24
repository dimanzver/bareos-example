#!/bin/sh

LOGIN="admin"
PASSWORD="password"
SQL_PATH="/root/dumps/"
MYSQLDUMP="mysqldump"
DATABASES="db1;db2;bareos"

dbs=$(echo "$DATABASES" | tr ";" "\n")
for database in $dbs
do
    echo "MySQL backup database: ${database}"
    $MYSQLDUMP -q -u$LOGIN -p$PASSWORD $database | gzip > ${SQL_PATH}${database}.sql.gz
done
