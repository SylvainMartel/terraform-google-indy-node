<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~>4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.26.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gpc_indy_node"></a> [gpc\_indy\_node](#module\_gpc\_indy\_node) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_resource_policy.snappolicy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy) | resource |
| [google_compute_image.ubuntu](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |
| [google_project.gpc_indy_node](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_candy_project"></a> [gcp\_candy\_project](#input\_gcp\_candy\_project) | a specific GCP project where to deploy the nodes | `any` | `null` | no |
| <a name="input_gcp_candy_region"></a> [gcp\_candy\_region](#input\_gcp\_candy\_region) | a specific GCP region | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->