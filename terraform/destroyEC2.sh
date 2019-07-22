#!/bin/bash

function basic(){
	echo
		cd newtest
	echo
		terraform destroy -auto-approve
	echo
}

function sendEmail(){
file=/home/ubuntu/terraform/newtest/terraform.tfstate

z=$(tac $file | grep -m 1 index_key)

A="$(echo $z | cut -d' ' -f2)"

B="$(echo $A | cut -d',' -f1)"
val=1
C=$(($B + $val))

mail -s "Total $C AWS Instances Terminated" ayyappa.hiremath@wipro.com < /home/ubuntu/terraform/newtest/terraform.tfstate

}

basic

sendEmail
