find / -perm -o+w -not -type l 2>/dev/null
find / -xdev -perm -4000 2>/dev/null
chmod g-s
rpm -Va
debsums -ca
capabilities
lsattr
getfacl
