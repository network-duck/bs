# Exit if any errors occur... much better than carrying on
set -e

# My poor fingers can't handle typing four more letters per line
ipt="iptables"

# Flush the current rules
$ipt -F; $ipt -X

# Allow services in. Since we have SSH, SMB, and HTTP, we want 22, 445, and 80
# We know these ports from `ss -plunt` earlier.
$ipt -A INPUT -p tcp -m multiport --dport 25,993,995,3306 -j ACCEPT

# Allow connections that are established in and out.
# -m is a iptables module (which is actually a new kernel module!)
$ipt -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
$ipt -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# OPTIONAL: Some competitions require outbound connections on port 80 and 443.
# You'll also need these (and DNS) to be able to update via dnf/yum or apt.
$ipt -A OUTPUT -p tcp -m multiport --dport 80,443 -j ACCEPT
$ipt -A INPUT -p udp --dport 53 -j ACCEPT
$ipt -A OUTPUT -p udp --dport 53 -j ACCEPT

# Finally, the danger line: drop any traffic that doesn't match.
$ipt -P FORWARD DROP; $ipt -P OUTPUT DROP; $ipt -P INPUT DROP
