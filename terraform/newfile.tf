provider "aws" {
   access_key = "AKIA2GENZUFJBYP6ZCMG"
   secret_key = "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"
   region     = "ap-south-1"
   }
   
resource "aws_instance" "installFabric" {
  count = 1
  ami           = "ami-04125d804acca5692"
  instance_type = "t2.micro"
  key_name = "terra"
  tags = {
    Name = "Server ${count.index}"
  }
  lifecycle {
    create_before_destroy = true
  }
  
  provisioner "file" {
    source      = "/home/ubuntu/scripts/fabric.sh"
    destination = "/tmp/fabric.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/fabric.sh",
      "/tmp/fabric.sh",
    ]
  }
  
  connection {
	host 	 = "${self.public_ip}"
    type     = "ssh"
    user     = "ubuntu"
	private_key = "${file("~/.ssh/terra.pem")}"
  }
}
