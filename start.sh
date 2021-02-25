#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

echo $RED
echo $BOLD
echo  "start builde minikube(virtualbox)"
echo $WHITE

export MINIKUBE_HOME=~/goinfre

minikube delete
minikube start --driver=virtualbox

echo $RED
echo $BOLD
echo "doing symlinks"

rm -rf ~/.minikube
ln -sf ~/goinfre/.minikube ~/.minikube

echo  "done starting minikube"
echo $WHITE
