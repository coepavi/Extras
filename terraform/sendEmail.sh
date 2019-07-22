#!/bin/bash

file=/home/ubuntu/terraform/newtest/terraform.tfstate.backup

z=$(tac $file | grep -m 1 index_key)

A="$(echo $z | cut -d' ' -f2)"

B="$(echo $A | cut -d',' -f1)"
val=1
C=$(($B + $val))

mail -s "Total AWS instances created: $C" ayyappa.hiremath@wipro.com < /home/ubuntu/terraform/newtest/terraform.tfstate.backup
