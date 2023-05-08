variable REGION {
  default = "us-east-1"
}

variable ZONE1 {
  default = "us-east-1a"
}

variable ZONE2 {
  default = "us-east-1b"
}

variable ZONE3 {
  default = "us-east-1c"
}

variable AMIS {
  type = map(any)
  default = {
    us-east-1 = "ami-03951dc3553ee499f"
    us-east-2 = "ami-06ad5df4b191f59d0"
  }
}

variable USER {
  default = "ec2-user"
}

variable PUB_KEY {
  default = "dybran-ec2.pub"
}

variable PRIV_KEY {
  default = "dybran-ec2"
}

variable MYIP {
    default = "192.168.56.1/32"
}