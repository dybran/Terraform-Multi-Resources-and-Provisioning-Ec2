terraform {
	backend "s3" {
	bucket = "dybran"
	key = "Dybran-terrastate/backend_s3"
	region = "us-east-1"
	}
}