# Read your password from the terminal and store it in $REPLY
read -p "Salt: "

# For users in /etc/passwd with a shell, take the username part of the line
    # NOTE: the format of /etc/passwd looks like this:
        # root:x:0:0:root:/root:/bin/bash
    # So that cut command is saying, take the first field when
    # the line is colon-delimited.
for u in $(cat /etc/passwd | grep -E "/bin/.*sh" | grep -v "admin" | cut -d":" -f1); do

    # Hash the current nanosecond with a salt
    ns=$(date +%N)
    pw=$(echo "${ns}$REPLY" | sha256sum | cut -d" " -f1)

    # Change the password with chpasswd
    echo "$u:$pw" | chpasswd

    # Print the password to the terminal
    echo "$u,$pw"

# Terminate the for loop
done

# Now, we have changed all user passwords on the system. We should now go through and lock all non-user accounts.
for u in $(cat /etc/passwd | grep -vE "/bin/.*sh" | cut -d":" -f1); do passwd -l $u; done
passwd -l root

for u in $(cat /etc/passwd | grep -E "/bin/.*sh" | grep -v "root" | grep -v "admin" | cut -d":" -f1); do
    usermod -s /bin/rbash "$u"
done
