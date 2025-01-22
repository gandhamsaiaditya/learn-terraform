module "components"
{
  for_each  = var.components
  source    = "./vm"
  component = each.value["name"]
  vm_size   = each.value["vm_size"]
}

variable "components"{
  default = {
    frontend = {


      name    = "frontend-dev"
      vm_size = "Standard_DS1_v2"
    }
    mongodb = {


      name    = "mondodb-dev"
      vm_size = "Standard_DS1_v2"
    }
    catalogue = {


      name    = "catalogue-dev"
      vm_size = "Standard_DS1_v2"
    }
    redis = {


      name    = "redis-dev"
      vm_size = "Standard_DS1_v2"
    }
    user = {


      name    = "user-dev"
      vm_size = "Standard_DS1_v2"
    }
    cart = {


      name    = "cart-dev"
      vm_size = "Standard_DS1_v2"
    }
    mysql = {


      name    = "mysql-dev"
      vm_size = "Standard_DS1_v2"
    }
    shipping = {


      name    = "shipping-dev"
      vm_size = "Standard_DS1_v2"
    }
    rabbitmq = {


      name    = "rabbitmq-dev"
      vm_size = "Standard_DS1_v2"
    }
    payment = {


      name    = "payment-dev"
      vm_size = "Standard_DS1_v2"
    }
    dispatch = {


      name    = "dispatch-dev"
      vm_size = "Standard_DS1_v2"
    }
  }
}
