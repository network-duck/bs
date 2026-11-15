echo "world write" > /root/perms_baseline
find / -perm -o+w -not -type l 2>/dev/null >> /root/perms_baseline

echo "suid" >> /root/perms_baseline
find / -xdev -perm -4000 2>/dev/null >> /root/perms_baseline

echo "sgid" >> /root/perms_baseline
find / -xdev -perm -2000 2>/dev/null >> /root/perms_baseline

echo "sticky" >> /root/perms_baseline
find / -xdev -perm -1000 2>/dev/null >> /root/perms_baseline

echo "immutable" >> /root/perms_baseline
lsattr -a /etc/ >> /root/perms_baseline

chmod 0644 /etc/passwd /etc/passwd- /etc/group /etc/group- /etc/fstab
chmod 0640 /etc/shadow /etc/shadow- /etc/gshadow /etc/gshadow-
chown root:root /etc/fstab /etc/passwd /etc/shadow /etc/group /var/spool/cron /boot/grub/grub.cfg
