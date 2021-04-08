#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

echo $RED
echo $BOLD
echo  "Stop Minikube"
echo $WHITE

kubectl delete -f ./srcs/yaml_active/metalLB.yaml
kubectl delete -f ./srcs/yaml_active/nginx.yaml
kubectl delete -f ./srcs/yaml_active/ftps.yaml
kubectl delete -f ./srcs/yaml_active/mysql.yaml
kubectl delete -f ./srcs/yaml_active/wordpress.yaml
kubectl delete -f ./srcs/yaml_active/phpmyadmin.yaml
minikube delete

echo $RED
echo $BOLD
echo  "Stop Container & Delete Images"
echo $WHITE
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker rmi -f $(docker images nginx -q)
docker rmi -f $(docker images wordpress -q)
docker rmi -f $(docker images ftps -q)
docker rmi -f $(docker images mysql -q)
docker rmi -f $(docker images phpmyadmin -q)
docker rmi -f $(docker images alpine -q)

rm ./srcs/yaml_active/*

echo $RED
echo $BOLD
echo  "Done"
echo $WHITE
