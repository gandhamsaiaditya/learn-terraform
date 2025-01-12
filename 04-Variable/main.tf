variable "v1" {
 default = "hello"
 
 }

 variable  "v2" {
 
   default = [
   
     "Helloo",
     2,
     false
   
   ]
   
   }

variable "v3" {

  default = {
    course = "devops"
    course = "azure"
  
  }

}

output "v1"{
  value = var.v1

}