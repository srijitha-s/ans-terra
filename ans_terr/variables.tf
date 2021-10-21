variable "project" {
  type        = string
  #default     = "manifest-access-320809"
  description = "Project id"
}

variable "region" {
  type        = string
  #default     = "us-west1"
  description = "Region where resource will be created"
}

variable "zone" {
  type        = string
  #default     = "us-west1-a"
  description = "zone where resource will be created"
}
variable "account_id" {
  type        = string
  #default     = "computepalasa"
  description = "Service Account id"
}

variable "display_sa_name" {
  type        = string
  #default     = "Service Account"
  description = "Service Account id"
}

variable "network_name" {
  type        = string
  #default     = "my-network7"
  description = "network-name"
}

# variable "instance_tags"{
#     type = object({
#         Name = string
#         foo = number
#     })
# }

variable "master_os_image" {
  type        = string
  #default     = "centos-cloud/centos-7"
  description = "OS image"
}



variable "name" {
  type        = string
  #default     = "test4"
  description = "name of the instance"
}

variable "machine_type" {
  type        = string
  #default     = "n2-standard-2"
  description = "machine type"
}

variable "disk_size" {
  type = number
  #default = 50
  description = "size of the disk"
}

variable "disk_type" {
  type = string
  #default = "pd-standard"
  description =  "We can select one of the following disk types: 'pd-standard', 'pd-ssd', 'pd-balanced' or 'pd-extreme'"
}

variable "auto_delete"{
type        = bool
#default     = false
description = "enable/disable auto delete "
}

variable "deletion_protection"{
type        = bool
#default     = false
description = "enable/disable deletion protection "
}


variable "instance_tags"{
type        = list(string)
#default     = ["abcc","def"]
description = "tags of instance"
}

/*variable "startup_url" {
  type        = string
  #default     = "gs://i2o-znext-ext-hcl-storagebucket/remote_login.ps1"
  description =  "startup script url of GCS"
}*/
