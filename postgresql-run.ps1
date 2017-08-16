docker volume create --name pg-data
docker volume create --name pg-run
docker run --name postgresql --restart always `
 -v pg-data:/var/lib/postgresql -v pg-run:/run/postgresql `
 --net host -p 5432:5432 `
 -d rsyuzyov/docker-postgresql-pro-1c