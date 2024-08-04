resource "aws_instance" "terrafrom-test-server" {
  ami               = "ami-04a81a99f5ec58529"
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = "terraformkey"
  count             = var.instances_per_subnet
  user_data         = <<EOF
  sudo -i
  sudo apt-get update
  #sudo apt-get update  -y
  sudo apt-get install openjdk-11-jdk -y
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install jenkins -y
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  EOF
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    NAME = "Production_server"
    ENV  = "production"
  }

}