variable "Resource_Group_Name" {
    description = "Please mention the Resource Group Name"
    type = string
    
}



variable "Location_Name" {
    description = "Please mention the location  Name"
    type = string
    
}




variable "Virtual_Network_Name" {
    description = "Please mention the Vnet  Name"
    type = string
    
}



variable "subnet_address_list__app" {
    description = "Please mention the Vnet  Name"
    type = list(string)
}

variable "subnet_address_list__bastion" {
    description = "Please mention the Vnet  Name"
    type = list(string)
}

variable "subnet_address_list_db" {
    description = "Please mention the Vnet  Name"
    type = list(string)
}

variable "subnet_address_list_web_server" {
    description = "Please mention the Vnet  Name"
    type = list(string)
}


variable "Subnet_Name_app" {
    description = "Please mention the Vnet  Name"
    type = string
    
}
variable "Subnet_Name_bastion" {
    description = "Please mention the Vnet  Name"
    type = string
    
}
variable "Subnet_Name_db" {
    description = "Please mention the Vnet  Name"
    type = string
    
}
variable "Subnet_Name_web_server" {
    description = "Please mention the Vnet  Name"
    type = string
    
}


variable "Network_security_Name_app" {
    description = "Please mention the Vnet  Name"
    type = string
    
}


variable "Network_security_Name_Bastion" {
    description = "Please mention the Vnet  Name"
    type = string
    
}

variable "Network_security_Name_web_server" {
    description = "Please mention the Vnet  Name"
    type = string
    
}


variable "Network_security_Name_db" {
    description = "Please mention the Vnet  Name"
    type = string
    
}


variable "Busniness_division" {
    type = string
  
}

variable "environment" {
    type = string
  
}