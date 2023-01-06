terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-gcp-372719"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-keys.json"
}
