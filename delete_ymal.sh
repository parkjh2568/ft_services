#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

echo $RED
echo $BOLD
echo  "Stop Minikube"

kubectl delete -f ./srcs/yaml_active/metalLB.yaml
kubectl delete -f ./srcs/yaml_active/nginx_d.yaml
kubectl delete -f ./srcs/yaml_active/nginx_s.yaml
echo  "Done"
echo $WHITE
