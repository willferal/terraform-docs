terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(var.credential_file)
  project = var.project
  region = var.region
  zone = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "f1-micro"
  tags = [
    "web",
    "dev"
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      //image = "cos-cloud/cos-stable" -> destructible changes: will renew the vm to apply the changes
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {

    }
  }
}

/*
Next steps:
 - authenticate with gcloud CLI to set up your credentials
 - Terraform init: to initialize the project
 - terraform fmt: to formatting the files of project
 - terraform validate: to verify if the structure of the files are valid
 - terraform apply: to apply de changes set in the terraform files
 - terraform show: to see all the values and attributes of the vm
 - terraform destroy: to destroy all the resources of the vm
*/