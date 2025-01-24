


resource "azurerm_network_interface" "main" {
  name                = "${var.component}-nic"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id

  }
}

resource "azurerm_network_security_group" "main" {
  name                = "${var.component}-nsg"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    component = var.component
  }
}

resource "azurerm_public_ip" "main" {
  name                = "${var.component}-pipp"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  allocation_method   = "Static"

  tags = {
    component = "${var.component}"
  }
}
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id          = azurerm_network_interface.main.id
  network_security_group_id     = azurerm_network_security_group.main.id
}

resource "azurerm_dns_a_record" "main" {
  name                = "${var.component}-dev"
  zone_name           = "devopsazurepractice.store"
  resource_group_name   = data.azurerm_resource_group.main.name
  ttl                 = 10
  records             = [azurerm_network_interface.main.private_ip_address]
}


resource "azurerm_virtual_machine" "main" {
  name                  = var.component
  location              = data.azurerm_resource_group.main.location
  resource_group_name   = data.azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
  id = "/subscriptions/560c39c6-a3a6-4e68-aa91-6418a1940cbd/resourceGroups/project-setup-1/providers/Microsoft.Compute/galleries/CreatedImage/images/VM_definition/versions/1.0.0"
  }
  storage_os_disk {
    name              = var.component
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.component
    admin_username = "aditya"
    admin_password = "aditya@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 # provisioner "remote-exec" {

  #  connection {
   #   type     = "ssh"
  #    user     = "aditya"
   #   password = "aditya@123456"
  #    host     = azurerm_public_ip.main.ip_address
  #  }
  #  inline = [

   #   "sudo dnf install python3.12-pip -y",
   #   "sudo pip3.12 install ansible",
   #   "ansible-pull -i localhost, -u https://github.com/gandhamsaiaditya/Roboshop-shell -e app.name=${var.component} -e env = dev"

  #  ]
 # }
}






