docker volume create --name zabbix-web
docker run --name zabbix-web --restart always `
 --net host `
 -v zabbix-web:/etc/ssl/apache2 `
 -e DB_SERVER_HOST="127.0.0.1" `
 -e POSTGRES_USER="postgres" `
 -e POSTGRES_PASSWORD="12345" `
 -e ZBX_SERVER_HOST="127.0.0.1" `
 -e TZ="Asia/Yekaterinburg" `
 -d zabbix/zabbix-web-apache-pgsql:alpine-trunk