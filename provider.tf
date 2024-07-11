# vSphere Provider
provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
  api_timeout          = 10
}


# vSphere Datacenter
data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

# vSphere Datastore
data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# vSphere Cluster
data "vsphere_compute_cluster" "cluster" {
  name          = var.compute_cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# vSphere VM Network
data "vsphere_network" "network" {
  name          = var.vm_network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}