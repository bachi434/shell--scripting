#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]; then
  echo -e "\e[1;31m you should be root user to execute to this script..\e[0m"
 exit 1

 fi

 if [ -f components/$1.sh ]; then
   bash components/$1.sh
   else
     echo -e "\e[1;31mInvalid Input\e[0m"
     exit 1
     fi





