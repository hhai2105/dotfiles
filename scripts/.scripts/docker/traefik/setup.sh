
if grep -qF "username" traefik-dynamic.yml; then
  echo "Credentials not found"
  exit
fi

sudo touch /etc/docker/volumes/traefik/acme.json
sudo chmod 600 /etc/docker/volumes/traefik/acme.json

sudo docker network create traefik
sudo docker compose up -d

