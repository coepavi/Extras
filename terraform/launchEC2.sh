#!/bin/bash

function basic(){
	echo
		rm -R newtest
	echo
		mkdir newtest
	echo
		cd newtest
	echo
		cp ../newfile.tf .	
	echo
		terraform init
		sleep 20
	echo
		terraform plan
		sleep 20
	echo
		terraform apply -auto-approve
	echo
}

function sendEmail(){
file=/home/ubuntu/terraform/newtest/terraform.tfstate

z=$(tac $file | grep -m 1 index_key)

A="$(echo $z | cut -d' ' -f2)"

B="$(echo $A | cut -d',' -f1)"
val=1
C=$(($B + $val))

mail -s "Total $C AWS Instance(s) Created" ayyappa.hiremath@wipro.com < /home/ubuntu/terraform/newtest/terraform.tfstate

}

echo
	clear
echo
file=/home/ubuntu/terraform/temp.tf
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 1) # Red
txtbold=$(tput bold)
txtul=$(tput smul)
txtule=$(tput rmul)
echo "${txtbold}"
#echo "${txtul}"
#echo " ***************************************************************************************************************************************"
echo " 		${txtul}                                                                                                                      ${txtule}"
echo 
echo " 		${txtred}  	  	                         AWS automation via DevOps Terraform					     ${txtrst}" 
echo "							-------------------------------------						      "	
#echo " 		${txtred}			( At end, Email notification will be triggered via AWS Cloud Watch )			     ${txtrst}"	
echo 
echo " 		${txtul}                                                                                                                      ${txtule}"
#echo " ***************************************************************************************************************************************"
#echo " ${txtred} ------ At end, Email will be triggered via AWS Cloud Watch   	------ ${txtrst}"
echo
echo
read -p "		Enter number of AWS instances required ? : " a
#echo " 		Enter number of AWS instances required ? : "
echo
echo "		${txtbold}Now, ${txtul} $a ${txtule} Instance will be created in AWS ${txtrst} ( At end, Email notification will be triggered via ${txtul} AWS CloudWatch ${txtule} )"
echo

sed s/"count = cnt"/"count = $a"/g $file > newfile.tf

basic

sendEmail

