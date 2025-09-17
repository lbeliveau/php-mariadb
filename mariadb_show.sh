#!/bin/bash

POD=$(kubectl get pod -l app=mariadb -o jsonpath="{.items[0].metadata.name}")
echo $POD
kubectl exec -it $POD -- mariadb -uroot -proot123 -e "USE employees; select * from employees;"
