<!-- BEGIN_TF_DOCS -->
## Requirements
You need to have deployed a Snapshot Schedule before launching this module(example coming soon)
SSH keys can be added project wide with *resource "google_compute_project_metadata"* before calling the module but looking for a way to do it within the module


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.client_external](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_disk.data_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_disk_resource_policy_attachment.data_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk_resource_policy_attachment) | resource |
| [google_compute_firewall.firewall_client_port](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.firewall_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.nodes_access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.indynode](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_network.vpc_client_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_network.vpc_node_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.node](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_port"></a> [client\_port](#input\_client\_port) | Port used for communications to the client | `number` | `9702` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | true or false to activate delete\_protection | `bool` | n/a | yes |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | n/a | `string` | n/a | yes |
| <a name="input_node_port"></a> [node\_port](#input\_node\_port) | Port used for nodes communications | `number` | `9701` | no |
| <a name="input_os_image"></a> [os\_image](#input\_os\_image) | name of the OS image to use | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region where to deploy | `string` | n/a | yes |
| <a name="input_snapshot_schedule_policy_name"></a> [snapshot\_schedule\_policy\_name](#input\_snapshot\_schedule\_policy\_name) | snapshot policy name to associate with the Datadisk | `string` | n/a | yes |
| <a name="input_ssh_firewall_allow_range"></a> [ssh\_firewall\_allow\_range](#input\_ssh\_firewall\_allow\_range) | list of IP's allowed to SSH in | `list(string)` | n/a | yes |
| <a name="input_vpc_client_subnet_cidr"></a> [vpc\_client\_subnet\_cidr](#input\_vpc\_client\_subnet\_cidr) | Subnet CIDR for VPC Client | `string` | n/a | yes |
| <a name="input_vpc_node_subnet_cidr"></a> [vpc\_node\_subnet\_cidr](#input\_vpc\_node\_subnet\_cidr) | Subnet CIDR for VPC Node | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | zone where to deploy | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->