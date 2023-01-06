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

resource google_storage_bucket "GCS1"{
    name = "bucket-from-tf-svcacctk1"
    location = "US"
}