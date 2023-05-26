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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuXAgMZATT9kXeH+t1oRHMJJ//KZcfmCdyDKUqUp7kk7pIutKuinhz7YJBF8XX1UiIwa89Vq30ZamEbjGiFVdLtDhWIJv4GmQGru2Ph9Kah3ON/HGszJR+YZJ8WSotN9o7DIJ5VbLwaR7s3xBpkPj1kzcUa/ZQhUaZ5Cy9aIGFNisp5hicCgLyovL/QzBEj6qexdmZxJLEddZNSj4ibyPkwy2V4BfFHvfnHh4eTbBhoSoHISX6BlUFPsxINZtJUjnxe1BF7/C84uBtri9ilf7UelsRObHUidPHabE6TWatv33KrpzNmYe0Rfv6mUKKHjXYWihdUij750P4cA4+dEUc51KYhAIsefo0FAYbJ0gG3K5OSieyn2QrqSGqoRCrWrUJEyJF6i3K23u0CEy0Vnvza6uUD/+gsMvsnw+Gn1GWeGiEc7kRhmFDzGJzCrY0FIZ6egXG/+jXN0Bm3jMu/aU6OaE8cAAKGCArUPFX2HE4gQThv2ejMYPBkKZuhDeo340= azureuser@jenkins"
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
