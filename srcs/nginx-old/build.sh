#!bin/bash

docker build -t nginx .
docker run -d -p80:80 -p443:443 -P --name test nginx
docker exec -it test /bin/sh
