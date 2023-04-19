# Define outputs
output "instance_name" {
  value = google_compute_instance.example.name
}

output "instance_ip" {
  value = google_compute_instance.example.network_interface[0].access_config[0].nat_ip
}