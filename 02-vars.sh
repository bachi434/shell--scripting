#!/bin/bash



student_name="raghu"

echo $student_name
echo ${student_name}

DATE=$(date +%F)

echo today date is $DATE

EXPR=$((3*7/9+65/85%9))
echo calculate = $EXPR

read -p "enter your name:" name
echo "your name $name"
 read -p "enter your course name:" name
 echo "your course name $name"

echo