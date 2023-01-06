resource "google_compute_network" "auto-vpc-tfk"{
  name = "auto-vpc-tfk"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-tfk"{
  name = "custom-vpc-tfk"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sgk" {
  name = "sub-sgk"
  network = google_compute_network.custom-vpc-tfk.id
   ip_cidr_range = "10.1.0.0/24"
   region = "asia-southeast1"
   private_ip_google_access = true
}

resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-tfk.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["143.198.16.54/32"]
  priority = 455
}

output "auto" {
  value = google_compute_network.auto-vpc-tfk.id
}

output "custom" {
  value = google_compute_network.custom-vpc-tfk.id
}