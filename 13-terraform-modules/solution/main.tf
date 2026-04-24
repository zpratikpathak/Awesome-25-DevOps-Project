provider "aws" {
  region = "us-east-1"
}

module "web_server" {
  source      = "./modules/ec2"
  ami_id      = "ami-0c55b159cbfafe1f0"
  server_name = "MyModuleWebServer"
}
