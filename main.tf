# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a new virtual machine instance
resource "google_compute_instance" "example" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network_name

    access_config {
      // Ephemeral IP address
    }
  }

  metadata = {
    // Custom metadata
  }

  tags = var.instance_tags

  # SSH key for the default user
  metadata_startup_script = file("startup.sh")
}

# Define input variables
variable "project_id" {
  description = "ID of the GCP project"
}

variable "region" {
  description = "GCP region to deploy resources to"
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone to deploy resources to"
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "Name of the virtual machine instance"
  default     = "example-vm"
}

variable "machine_type" {
  description = "Machine type of the virtual machine instance"
  default     = "e2-medium"
}

variable "image" {
  description = "Image to use for the boot disk"
  default     = "debian-cloud/debian-10"
}

variable "network_name" {
  description = "Name of the network to attach the instance to"
  default     = "default"
}

variable "instance_tags" {
  description = "List of tags to attach to the instance"
  default     = ["web-server"]
}