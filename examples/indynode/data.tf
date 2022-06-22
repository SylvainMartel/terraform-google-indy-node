data "google_compute_image" "ubuntu" {
  project = "ubuntu-os-pro-cloud"
  family  = "ubuntu-pro-1604-lts"

}

data "google_compute_zones" "available" {

}

data "google_project" "gpc_indy_node" {


}
