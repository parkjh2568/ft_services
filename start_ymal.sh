#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

MINIKUBE_IP=$(minikube ip)
eval $(minikube docker-env)
 sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yaml_format/metalLB-format.yaml > ./srcs/yaml_active/metalLB.yaml
cp ./srcs/yaml_format/metalLB-format.yaml ./srcs/yaml_active/metalLB.yaml
cp ./srcs/yaml_format/nginx_deployment-format.yaml ./srcs/yaml_active/nginx_d.yaml
cp ./srcs/yaml_format/nginx_service-format.yaml ./srcs/yaml_active/nginx_s.yaml

kubectl apply -f ./srcs/yaml_active/metalLB.yaml
kubectl apply -f ./srcs/yaml_active/nginx_d.yaml
kubectl apply -f ./srcs/yaml_active/nginx_s.yaml

echo $RED
echo $BOLD
echo  "Done"
echo $WHITE
