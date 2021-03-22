provider "google" {
  credentials = file("assets/credentials.json")
  project = lookup(var.gcp_global, "project_name")
}

resource "google_storage_bucket" "hello-world-storage" {
  name = lookup(var.storage_infos, "bucket_name")
  location = lookup(var.storage_infos, "location")
}