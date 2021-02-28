#!/bin/env bash -e

RED="\033[31m"
BOLD="\033[01m"
WHITE="\033[0m"

echo $RED
echo $BOLD
echo  "Start Build Minikube(Virtualbox)"
echo $WHITE

minikube delete
minikube start --driver=virtualbox

echo $RED
echo $BOLD
echo "doing symlinks"

echo  "Done"
echo $WHITE
