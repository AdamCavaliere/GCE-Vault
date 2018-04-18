provider "google" {
  project = "vaultexample-autobuild"
  region  = "us-central1"

  #credentials = "${base64decode("${data.vault_generic_secret.service_account.data["private_key_data"]}")}"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  // Local SSD disk
  scratch_disk {}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

#provider "vault" {}


#data "vault_generic_secret" "service_account" {
#  path = "gcp/key/terraform"
#}

