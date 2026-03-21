
if grep -qF "username" traefik-dynamic.yml; then
  echo "Credentials not found"
  exit
fi

touch ./acme.json
chmod 600 ./acme.json

docker network create traefik
docker compose up -d

