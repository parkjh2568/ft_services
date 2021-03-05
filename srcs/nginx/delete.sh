#!bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images nginx -q)
docker rmi -f $(docker images \<none\> -q)
docker rmi -f $(docker images \(none\) -q)
