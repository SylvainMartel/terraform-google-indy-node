
# We create 2 VPC per node.  1 for the client comm, the other for nodes intercommunications

resource "google_compute_network" "vpc_client_network" {
  name                    = "${var.node_name}-client-vpc-${var.client_port}"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

}


resource "google_compute_network" "vpc_node_network" {
  name                    = "${var.node_name}-node-vpc-${var.node_port}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "client" {
  name          = "${var.node_name}-client-subnet-${var.client_port}"
  ip_cidr_range = var.vpc_client_subnet_cidr
  network       = google_compute_network.vpc_client_network.name
  region        = var.region
}

resource "google_compute_subnetwork" "node" {
  name          = "${var.node_name}-client-node-${var.node_port}"
  ip_cidr_range = var.vpc_node_subnet_cidr
  network       = google_compute_network.vpc_node_network.name
  region        = var.region
}

resource "google_compute_address" "client_external" {
  address_type = "EXTERNAL"
  name         = "${var.node_name}-client-external-ip"
}



// VPC firewall configuration
resource "google_compute_firewall" "firewall_ssh" {
  name    = "${var.node_name}-ssh-for-admin-access"
  network = google_compute_network.vpc_client_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "tcp"
    ports    = ["${var.client_port}"]
  }


  direction     = "INGRESS"
  source_ranges = var.ssh_firewall_allow_range
}

resource "google_compute_firewall" "firewall_client_port" {
  name    = "${var.node_name}-client-access-${var.client_port}"
  network = google_compute_network.vpc_client_network.name

  allow {
    protocol = "tcp"
    ports    = ["${var.client_port}"]
  }


  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "nodes_access" {
  name    = "${var.node_name}-node-access-${var.node_port}"
  network = google_compute_network.vpc_node_network.name

  allow {
    protocol = "tcp"
    ports    = ["${var.node_port}"]
  }


  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}




resource "google_compute_disk" "data_disk" {
  name                      = "${var.node_name}datadisk"
  type                      = "pd-ssd"
  zone                      = var.zone
  size                      = 250
  physical_block_size_bytes = 4096
}

resource "google_compute_disk_resource_policy_attachment" "data_disk" {
  name = var.snapshot_schedule_policy_name
  disk = google_compute_disk.data_disk.name
  zone = var.zone
}




resource "google_compute_instance" "indynode" {
  name         = var.node_name
  machine_type = "n1-standard-2"
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.os_image
    }
    auto_delete = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.client.name
    access_config {
      nat_ip = google_compute_address.client_external.address
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.node.name
  }

  attached_disk {
    source = google_compute_disk.data_disk.id
  }

  # metadata = {
  #   ssh-keys = "${var.ssh_keys}"
  # }


  deletion_protection       = var.deletion_protection
  allow_stopping_for_update = true
}
