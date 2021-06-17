# Author - Alexandre S. Cezar

output "instance_docker_public_ip" {
  value = google_compute_instance.vm-docker[count.index].network_interface.0.access_config.0.nat_ip
}