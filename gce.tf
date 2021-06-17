# Author - Alexandre S. Cezar

# Create the Instance
resource "google_compute_instance" "vm-docker" {
  name         = "vm-docker-${count.index + 1}"
  machine_type = var.docker_machine_size
  zone         = var.zone_name
  count         = var.instance_count

  boot_disk {
    initialize_params {
      image = var.image_name
      size = 20
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    subnetwork   = google_compute_subnetwork.subnet.id
    access_config {
    }
  }

  metadata_startup_script = <<SCRIPT
        apt-get -y update
        apt-get -y upgrade
        apt install -y apt-transport-https ca-certificates curl software-properties-common npm
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        apt-get -y update
        apt-get -y install docker.io containerd docker-compose
        systemctl enable docker.service
        systemctl enable containerd.service
        systemctl start docker.service
        systemctl start containerd.service
        SCRIPT

  labels = {
    app = "docker",
    role = "class"
  }

  tags = ["docker"]
}