docker  volume create --name portainer
docker run --name portainer --restart always -v portainer:/data -p 9000:9000 -d portainer/portainer