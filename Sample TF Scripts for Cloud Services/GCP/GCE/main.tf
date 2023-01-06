resource "google_compute_instance" "vm-from-tfk" {
  name = "vm-from-tfk"
  zone ="asia-southeast1-a"
  machine_type = "n1-standard-2"
  allow_stopping_for_update = true
  network_interface {
    network = "custom-vpc-tfk"
    subnetwork = "sub-sgk"
  }

boot_disk {
  initialize_params{
    image = "debian-10-buster-v20221206"
    size = 35
  }
    auto_delete = false
}

scheduling {
  preemptible = false
  automatic_restart = false
}

service_account {
  email = "terraform-gcp@terraform-gcp-372719.iam.gserviceaccount.com"
  scopes = ["cloud-platform"]
}

lifecycle {
  ignore_changes = [
    attached_disk
  ]
}

labels = {
  "env" = "tflearning"
}

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = "asia-southeast1-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tfk.id
}