# vSphere Authentication
variable "vsphere_user" {
  type        = string
  description = "User name for vSphere API operations."
}

variable "vsphere_password" {
  type        = string
  description = "Password for vSphere API operations."
  sensitive   = true  // This will prevent the password from being displayed in logs or CLI output
}

variable "vsphere_server" {
  type        = string
  description = "vSphere server for API operations."
}


# vSphere Resources
variable "datacenter_name" {
  description = "Name of the vSphere datacenter"
  type        = string
}

variable "datastore_name" {
  description = "Name of the vSphere datastore"
  type        = string
}

variable "compute_cluster_name" {
  description = "Name of the vSphere compute cluster"
  type        = string
}

variable "vm_network_name" {
  description = "Name of the VM network"
  type        = string
}


# VM Template
variable "datacenter" {
  description = "vSphere data center"
  type        = string
}
variable "ubuntu_name" {
  description = "Ubuntu name (ie: image_path)"
  type        = string
}