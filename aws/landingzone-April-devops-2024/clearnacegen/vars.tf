variable "instance_type" {
  description = "Type of instance we are going to launch"
  type        = string
  default     = "t2.micro"
}
variable "availability_zone" {
  description = "In which Az instacne available"
  type        = string
  default     = "us-east-1a"

}
variable "region" {
  description = "which region aws resource launching"
  type        = string
  default     = "us-east-1"
}
variable "instances_per_subnet" {
  description = "How many no of instances we need"
  type        = number
  default     = 2
}
