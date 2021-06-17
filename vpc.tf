# Author - Alexandre S. Cezar

# Creates the VPC
resource "google_compute_network" "vpc" {
  name                    = var.project_name
  auto_create_subnetworks = "false"
}

# Configure the Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.project_name
  region        = var.region_name
  network       = google_compute_network.vpc.name
  ip_cidr_range = "192.168.110.0/24"
}

# Create the Google Firewall Policies that allows SSH to the instance
resource "google_compute_firewall" "docker-ssh" {
  name    = "allow-ssh-docker"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Allow traffic from anywhere to instances with a docker tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker"]

  depends_on = [google_compute_network.vpc]
}

# Create the Google Firewall Policies that allows HTTP to the  instance
resource "google_compute_firewall" "docker-app" {
  name    = "allow-http-app"
  network = var.project_name
  priority = 200

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  # Allow traffic from anywhere to instances with a docker tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker"]

  depends_on = [google_compute_network.vpc]
}

# Create the Google Firewall Policies for the internal instance to access the Internet
resource "google_compute_firewall" "allow-instance-outbound" {
  direction = "EGRESS"
  name    = "allow-instance-outbound"
  network = var.project_name
  priority = 1000

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker"]

  depends_on = [google_compute_network.vpc]
}