resource "google_compute_resource_policy" "snappolicy" {
  name   = "nodesnapweekly"
  region = var.gcp_candy_region
  snapshot_schedule_policy {
    schedule {
      weekly_schedule {
        day_of_weeks {
          start_time = "04:00"
          day        = "SATURDAY"
        }
      }
    }
    retention_policy {
      max_retention_days    = 60
      on_source_disk_delete = "APPLY_RETENTION_POLICY"
    }
  }
}


module "gpc_indy_node" {
  source = "https://github.com/kinwolfqc/terraform-google-indy-node.git?ref=test-pipeline"

  count                         = 2
  vpc_node_subnet_cidr          = "10.0.1.0/24"
  vpc_client_subnet_cidr        = "10.0.2.0/24"
  region                        = "us-central1"
  node_name                     = "node-${count.index + 1}"
  zone                          = data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)]
  os_image                      = data.google_compute_image.ubuntu.id
  snapshot_schedule_policy_name = google_compute_resource_policy.snappolicy.name
  ssh_firewall_allow_range      = ["0.0.0.0/0"]
  deletion_protection           = false
}
