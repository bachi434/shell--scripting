#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]; then
  echo -e "\e[1;31m you should be root user to execute to this script..\e[0m"
 exit
 fi




