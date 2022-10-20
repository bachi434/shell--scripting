#!/bin/bash

###string expressions
a=abc1
if [ $a = abc ]; then
  echo ok
fi

if [ $a != abc ]; then
  echo NOT OK
  fi
