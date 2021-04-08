#!bin/bash

# 미니큡 실행
#minikube delete
#minikube start --vm-driver=virtualbox

#docker 의 이미지들을 minikube 에서 사용할수 있도록
eval $(minikube docker-env)

# 이미지 빌드
docker build -t honlee_nginx srcs/nginx
#docker build -t honlee_mysql srcs/mysql
#docker build -t honlee_wordpress srcs/wordpress
#docker build -t honlee_phpmyadmin srcs/phpmyadmin
#docker build -t honlee_ftps srcs/ftps
#docker build -t honlee_influxdb srcs/influxdb
#docker build -t honlee_telegraf srcs/telegraf
#docker build -t honlee_grafana srcs/grafana
# 로드밸런서
minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml


# 디플로이먼트와 서비스 어플라이
#kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/nginx.yaml
#kubectl apply -f ./srcs/phpmyadmin.yaml
#kubectl apply -f ./srcs/ftps.yaml
#kubectl apply -f ./srcs/wordpress.yaml
#kubectl apply -f ./srcs/influxdb.yaml
#kubectl apply -f ./srcs/telegraf.yaml
#kubectl apply -f ./srcs/grafana.yaml

#echo "대쉬보드를 실행합니다."
minikube dashboard
