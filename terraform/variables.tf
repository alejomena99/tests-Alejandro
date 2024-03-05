variable "prefix" {
  default = "alejo"
}

variable "resource_group_name" {
  default = "#{RESOURCE_GROUP}#"
}

variable "location" {
  default = "eastus2"
}

variable "ssh_file_path" { 
    type = string
    sensitive = true
    default = "#{sshPub}#"
}