docker volume create --name compose-ui
docker run --restart always `
 --name compose-ui `
 -p 5000:5000 `
 -w /opt/docker-compose-projects/ `
 -v compose-ui:/opt/docker-compose-projects -v /var/run/docker.sock:/var/run/docker.sock `
 -d francescou/docker-compose-ui:1.4.1