resource "azurerm_linux_virtual_machine" "example" {
  name                = "master-vm"
  resource_group_name =var.resource_group_name
  location            =var.location
  size                = "Standard_DS2_v2"
  admin_username      = "ubuntu"
  network_interface_ids = [
    azurerm_network_interface.master-nw-interface.id,
  ]


  admin_ssh_key {
    username   = "ubuntu"
    #public_key = file("~/.ssh/id_rsa.pub")
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfsmDgEh24S6aC87dNehE7oNjCrEol/YnWwbzh0bUxIN7pvutf0k10gRyCzB0iJqGRMDqDKrnsOVAsEG93Wa62yinjWExjhyzWYGXAfsMW4L8+yPLM4OzHYxAxxnbLqjmoAhh+dguTxky9tUF/OIYphhbrXkpHLPw4cOUsL+9rm5IhwOb/TGgJWQKx2h227akHw+u4LB3+NET+KaDL5DgR1ltnOIYefwtW+i1gsaVzidj2kxiTJvr/4KhelOSmSUvBQojv8Hs7Uv0yovPUECxBjmpBUsiWRpKHEKFutfJlzNurPgns/LPhiZ2aZ4tDotBD4FyFG5y5ciIUte0F6zmTJtnut5Bviszpwsba8OuSqDSByzpNDjOFH4RSHh2I/heFRDo5M2mKSviHn2NPqmCctGyIbyUEmSh7keff27/7hZlyyQSw7m9CfiO/6WmRumEzH9QUcmrBWGMMXiusPSj4lFI2P6m9gsD+DHyfK+Buh2eRjva4VVNNd20mqBBdX8M= manojsai5855@jenkins"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
