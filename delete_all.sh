#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

echo $RED
echo $BOLD
echo  "Stop Minikube"
echo $WHITE

minikube delete

echo $RED
echo $BOLD
echo  "Stop Container & Delete Images"
echo $WHITE

docker rm $(docker ps -a -q)

docker rmi $(docker images alpine -q)

rm ./srcs/yaml_active/*

echo $RED
echo $BOLD
echo  "Done"
echo $WHITE