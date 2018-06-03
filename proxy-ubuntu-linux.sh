#!/bin/bash
#
# Ubuntu 14 LTS
#

set -v

sudo apt-get -y update

sudo apt-get install -y ntpdate
sudo apt-get install -y squid3 apache2-utils

sudo cp /etc/squid3/squid.conf /etc/squid3/squid.conf.bak

cat << EOF > /etc/squid3/squid.conf
http_port 3144
http_access allow all
cache deny all
forwarded_for delete
request_header_access Via deny all
EOF

sudo service squid3 restart

echo "IP ADDRESS"

curl ifconfig.co

#Be sure to shutdown/terminate your VM after you are done!