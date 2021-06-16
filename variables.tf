# Author - Alexandre S. Cezar

variable "project_name" {
  type        = string
  description = "Microsegmentation class project name."
  default     = ""
}

variable "region_name" {
  type        = string
  description = "The Region name used in this project."
  default     = "us-east1"
}

variable "zone_name" {
  type        = string
  description = "The Zone name used in this project."
  default     = "us-east1-c"
}

variable "docker_machine_size" {
  type        = string
  description = "Bastion instance size"
  default     = "n1-standard-1"
}

variable "image_name" {
  type        = string
  description = "VM image name"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}
