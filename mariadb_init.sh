#!/bin/bash

POD=$(kubectl get pod -l app=mariadb -o jsonpath="{.items[0].metadata.name}")
echo $POD
kubectl exec -it $POD -- mariadb -uroot -proot123 -e "DROP DATABASE IF EXISTS employees;"
kubectl exec -it $POD -- mariadb -uroot -proot123 -e "CREATE DATABASE employees;"
kubectl exec -it $POD -- mariadb -uroot -proot123 -e "USE employees; CREATE TABLE employees (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100), age INT, department VARCHAR(50), salary DECIMAL(10,2), hire_date DATE);"
kubectl exec -it $POD -- mariadb -uroot -proot123 -e "USE employees; INSERT INTO employees (name, age, department, salary, hire_date) VALUES ('John Doe', 30, 'HR', 50000.00, '2022-05-10'), ('Jane Smith', 28, 'IT', 70000.00, '2021-09-15'), ('Alice Johnson', 35, 'Finance', 80000.00, '2019-11-20'), ('Bob Williams', 40, 'Marketing', 60000.00, '2018-07-03'), ('Charlie Brown', 25, 'IT', 55000.00, '2023-01-10');"
