variable "vpc_id" {
  type = string
  //fake
  default = "vpc-0f3aaf92380a66d38"
}
variable "private_subnets" {
  type = list(any)
  //fake
  default = [
    "subnet-0808a66205d5be6f6",
    "subnet-08fd48c0f58f246d1"
  ]
}
