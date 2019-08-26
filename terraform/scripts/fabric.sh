#!/bin/bash
#
#

function basic(){
	echo
		mkdir fabric
	echo
		sudo apt-get install -y curl
	echo
		sudo apt-get install -y jq
	echo
}


function goLang(){
	echo
		cd ./fabric
	echo
		sudo apt-get update
	echo
		curl -O https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz
	echo
		tar -xvf go1.11.2.linux-amd64.tar.gz
	echo
		sudo mv go /usr/local
	echo
		echo "export GOPATH=$HOME/go" >> ~/.profile
		echo "PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile
		source ~/.profile
		sudo apt-get install -y golang-go
	echo


	echo
}

function docker(){
	echo
		sudo apt-get update
	echo
		apt-cache policy docker-ce
	echo
		sudo apt-get install -y docker
	echo
		sudo apt-get install -y docker-compose
	echo
}

function node(){
	echo
		curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	echo
		sudo apt-get install -y nodejs
	echo
		sudo apt install -y npm
	echo
#		sudo apt-get install -y docker-compose
	echo
}

function fabric(){
	echo
#		chmod 777 /var/run/
		chmod 777 /var/run/docker.sock
	echo
		sudo usermod -a -G docker $USER
	echo
#		sudo reboot
#		sleep 10
	echo
		curl -sSL http://bit.ly/2ysbOFE | bash -s
	echo
	echo
	#	sleep 5
	#	cd /home/ubuntu/fabric/fabric-samples/balance-transfer
	echo
		sudo apt-get install -y jq
	echo
	echo
}


function versions(){
	echo	"node version: "
		node --version
	echo	"npm version: "
		npm --version
	echo	"go version: "
		go version
	echo	"docker version: "
		docker --version
	echo	"docker-compose version: "
		docker-compose --version
	echo
}

echo "started"
echo "** started **"

basic
echo "started for GOlang"
echo "** started for GOlang **"
goLang
echo "started Docker & Docker compose"
echo "** started Docker & Docker compose **"
docker
echo "started Node & NPM"
echo "** started Node & NPM **"
node
echo "started Fabric "
echo "** started Fabric **"
fabric
echo "Summary :" 
versions

