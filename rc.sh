# Move profile files so they don't get loaded (yes this is cheese)
mv /etc/prof{i,y}le.d; mv /etc/prof{i,y}le

# Remove all common runcommand files in /home and /root
for f in ('~/.profile' '~/.bashrc' '~/.bash_login'); do
    find /home /root -iname "$f" -delete
done
