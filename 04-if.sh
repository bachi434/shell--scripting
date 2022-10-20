#!/bin/bash

###string expressions
a=abc1
if [ $a = abc ]; then
  echo ok
fi

if [ $a != abc ]; then
  echo NOT OK
  fi

if [ -z $b ]; then
  echo b is empty  / not declared varaible
  fi