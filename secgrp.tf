resource "aws_security_group" "dybran-sg" {
  name        = "dybran-prj-sg"
  description = "sec group for dybran ssh"
  vpc_id      = aws_vpc.dybran.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dybran-prj-sg"
  }
}