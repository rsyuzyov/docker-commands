docker volume create --name zabbix-custom-config
docker volume create --name zabbix-alertscripts
docker volume create --name zabbix-externalscripts
docker volume create --name zabbix-certs
docker volume create --name zabbix-keys
docker volume create --name zabbix-modules
docker volume create --name zabbix-mibs
docker volume create --name zabbix-snmp
docker volume create --name zabbix-openldap

docker run --name zabbix --restart always `
    --net host `
    -v /etc/localtime:/etc/localtime:ro `
    -v zabbix-custom-config:/etc/custom-config `
    -v zabbix-custom-alertscripts:/usr/local/share/zabbix/alertscripts `
    -v zabbix-custom-externalscripts:/usr/local/share/zabbix/externalscripts `
    -v zabbix-custom-certs:/usr/local/share/zabbix/ssl/certs `
    -v zabbix-custom-keys:/usr/local/share/zabbix/ssl/keys `
    -v zabbix-custom-modules:/usr/lib/zabbix/modules `
    -v zabbix-custom-mibs:/usr/share/snmp/mibs `
    -v zabbix-custom-snmp:/etc/snmp `
    -v zabbix-custom-openldap:/etc/openldap `
    --env="ZS_DBHost=127.0.0.1" `
    --env="ZS_DBUser=postgres" `
    --env="ZS_DBPassword=12345" `
    monitoringartist/zabbix-xxl:latest

