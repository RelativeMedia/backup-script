#!/bin/bash
BUCKET="somebucket.com"
DBNAME="somedatabase"

tar -zcvf /tmp/os.$BUCKET.tar.gz /etc/passwd /etc/fstab /etc/hosts /etc/group /etc/apache2 /etc/mysql/my.cnf /var/www/$BUCKET && s3cmd put /tmp/os.$BUCKET.tar.gz s3://$BUCKET && rm /tmp/os.$BUCKET.tar.gz;
mysqldump --defaults-extra-file=/opt/backup-script/database.cnf $DBNAME > /tmp/$DBNAME.sql && tar -zcvf /tmp/db.$BUCKET.tar.gz /tmp/$DBNAME.sql && s3cmd put /tmp/db.$BUCKET.tar.gz s3://$BUCKET && rm /tmp/db.$BUCKET.tar.gz;
