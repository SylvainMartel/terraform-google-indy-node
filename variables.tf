variable "vpc_client_subnet_cidr" {
  description = "Subnet CIDR for VPC Client"
  type        = string
}

variable "vpc_node_subnet_cidr" {
  description = "Subnet CIDR for VPC Node"
  type        = string
}

variable "region" {
  description = "region where to deploy"
  type        = string
}

variable "os_image" {
  description = "name of the OS image to use"

}

variable "ssh_firewall_allow_range" {
  description = "list of IP's allowed to SSH in"
  type        = list(string)
}
variable "zone" {
  description = "zone where to deploy"
  type        = string
}

variable "node_port" {
  description = "Port used for nodes communications"
  type        = number
  default     = 9701

}

variable "client_port" {
  description = "Port used for communications to the client"
  type        = number
  default     = 9702

}
variable "node_name" {
  type = string

}

variable "snapshot_schedule_policy_name" {
  description = "snapshot policy name to associate with the Datadisk"
  type        = string
}

variable "deletion_protection" {
  description = "true or false to activate delete_protection"
  type        = bool

}
