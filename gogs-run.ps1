docker volume create --name gogs
docker run --name=gogs --restart always `
 -v gogs:/data `
 -p 10022:22 -p 10080:3000 `
 -d gogs/gogs