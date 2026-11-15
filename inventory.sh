mkdir http_backup
cp -rp /var/www/html http_backup/webdir
cp -rp /etc/httpd/ http_backup/conf
tar zcf http_backup.tar.gz http_backup
gpg -c http_backup.tar.gz

It will prompt you for a password
rm -f http_backup.tar.gz
rm -rf http_backup
