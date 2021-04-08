#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

echo $RED
echo $BOLD
echo  "Start Build Minikube(Virtualbox)"
echo $WHITE

export MINIKUBE_HOME=~/goinfre

#docker pull k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1

minikube delete
minikube start --driver=virtualbox

eval $(minikube docker-env)
MINIKUBE_IP=$(minikube ip)

echo $RED
echo $BOLD
echo "Doing Symlinks"

rm -rf ~/.minikube
ln -sf ~/goinfre/.minikube ~/.minikube



echo "Active Addons"

minikube addons enable metallb
echo $WHITE

echo $RED
echo $BOLD
echo "Install Alpine"
echo $WHITE

docker pull alpine:3.12

echo $RED
echo $BOLD
echo "Docker Build"
echo $WHITE

docker build -t nginx srcs/nginx #> /dev/null 2>&1 ;;> /dev/null은 이과정의 메시지를 화면에표시하지않게해주는 명령어 2>&1 은 이과정중 나오는 에러메시지까지 다 가려주는 커멘드(안쓸꺼임)
docker build -t ftps srcs/ftps
docker build -t mysql srcs/mysql
docker build -t wordpress srcs/wordpress


echo $RED
echo $BOLD
echo "Apply Yaml"
echo $WHITE

#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" #스피커간의 통신을 암호화한다는 말

 sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yaml_format/metalLB-format.yaml > ./srcs/yaml_active/metalLB.yaml
 sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yaml_format/ftps-format.yaml > ./srcs/yaml_active/ftps.yaml
#cp ./srcs/yaml_format/metalLB-format.yaml ./srcs/yaml_active/metalLB.yaml
cp ./srcs/yaml_format/nginx-format.yaml ./srcs/yaml_active/nginx.yaml
cp ./srcs/yaml_format/mysql-format.yaml ./srcs/yaml_active/mysql.yaml
cp ./srcs/yaml_format/wordpress-format.yaml ./srcs/yaml_active/wordpress.yaml

kubectl apply -f ./srcs/yaml_active/metalLB.yaml
kubectl apply -f ./srcs/yaml_active/nginx.yaml
kubectl apply -f ./srcs/yaml_active/ftps.yaml
kubectl apply -f ./srcs/yaml_active/mysql.yaml
kubectl apply -f ./srcs/yaml_active/wordpress.yaml

echo $RED
echo $BOLD
echo  "Done"
echo $WHITE

minikube dashboard
