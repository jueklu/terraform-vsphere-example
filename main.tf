# Define template
data "vsphere_virtual_machine" "ubuntu" {
  name          = "/${var.datacenter}/vm/${var.ubuntu_name}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


# virtual machine configuration
resource "vsphere_virtual_machine" "vm" {
  name             = "vm1" # Define VM name in vSphere
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus         = 2
  memory           = 2048

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  wait_for_guest_net_timeout = -1
  wait_for_guest_ip_timeout  = -1
  
  disk {
    label          = "disk0"
    thin_provisioned = true
    size             = 16
  }

  guest_id = "ubuntu64Guest" # Define vSphere VM type

  # Clone VM from template
  clone { 
    template_uuid  = data.vsphere_virtual_machine.ubuntu.id

    # Customize the new VM
    customize {
      linux_options {
        host_name = "ubuntu-1" # Define VM host name
        domain    = "local"
      }

      network_interface {
        ipv4_address = "192.168.70.120"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.70.1"
    }
  }
}