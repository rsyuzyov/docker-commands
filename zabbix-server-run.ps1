docker volume create --name zabbix-alertscripts
docker volume create --name zabbix-externalscripts
docker volume create --name zabbix-enc
docker volume create --name zabbix-modules
docker volume create --name zabbix-ssh_keys
docker volume create --name zabbix-certs
docker volume create --name zabbix-keys
docker volume create --name zabbix-ssl_ca
docker volume create --name zabbix-snmptraps
docker volume create --name zabbix-mibs

docker run --name zabbix-server --restart always `
 -v zabbix-alertscripts:/usr/lib/zabbix/alertscripts `
 -v zabbix-externalscripts:/usr/lib/zabbix/externalscripts `
 -v zabbix-enc:/var/lib/zabbix/enc `
 -v zabbix-modules:/var/lib/zabbix/modules `
 -v zabbix-ssh_keys:/var/lib/zabbix/ssh_keys `
 -v zabbix-certs:/var/lib/zabbix/ssl/certs `
 -v zabbix-keys:/var/lib/zabbix/ssl/keys `
 -v zabbix-ssl_ca:/var/lib/zabbix/ssl/ssl_ca `
 -v zabbix-snmptraps:/var/lib/zabbix/snmptraps `
 -v zabbix-mibs:/var/lib/zabbix/mibs `
 --net host -p 10051:10051 -p 80:80 `
 -e DB_SERVER_HOST="127.0.0.1" -e POSTGRES_USER="postgres" -e POSTGRES_PASSWORD="12345" `
 -d zabbix/zabbix-server-pgsql:alpine-trunk
 