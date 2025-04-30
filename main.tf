resource "aws_instance" "name" {
    ami = "i-0eb64aa89b0b6fb4d"
    instance_type = "t2.micro"
    tags = {
      "Name" = "demo-instance" 
    }
  
}
