provider "google" {
  project     = var.project
  region      = var.region
}


resource "google_service_account" "default" {
  account_id   = var.account_id
  display_name = var.display_sa_name
}


resource "google_compute_network" "default" {
name = var.network_name
}


resource "google_compute_subnetwork" "default" {
name = "${var.network_name}-subnetwork"
ip_cidr_range = "10.0.0.0/16"
region = var.region
network = google_compute_network.default.id
}

resource "google_compute_address" "internal_with_subnet_and_address" {
name = "my-internal-address"
subnetwork = google_compute_subnetwork.default.id
address_type = "INTERNAL"
#address = "10.0.42.42"
region = var.region
}


/*resource "google_compute_address" "external_with_subnet_and_address" {
name = "my-external-address"
subnetwork = google_compute_subnetwork.default.id
address_type = "EXTERNAL"
address = "10.0.42.42"
region = var.region
}*/

resource "google_compute_global_address" "default" {
  project      = var.project# Replace this with your service project ID in quotes
  name         = "my-inter-add"
  #subnetwork = google_compute_subnetwork.default.id
  address_type = "EXTERNAL"
  # address      =  "10.0.42.42"
  ip_version   = "IPV6"
}

resource "google_compute_instance" "default" {
  name                 = var.name #"test"
  machine_type         = var.machine_type #"e2-medium"
  zone                 = var.zone
  deletion_protection  = var.deletion_protection

  tags = var.instance_tags

  boot_disk {
    auto_delete = var.auto_delete
    initialize_params {
      size  = var.disk_size 
      type  = var.disk_type
      image = "centos-cloud/centos-7"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    #   network = var.network_name
    #   subnetwork = "${var.network_name}-subnetwork"
    network = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.default.id
    #	network_ip = 

    access_config {
      // Ephemeral public IP
    }
  }

  /*metadata = {
    windows-startup-script-url = var.startup_url
  }*/

  #metadata_startup_script = var.startup_url

  scheduling {
    automatic_restart = false
  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform", "https://www.googleapis.com/auth/devstorage.full_control"]
  }
}
