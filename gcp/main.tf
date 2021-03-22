provider "google" {
  credentials = file("assets/credentials.json")
  project     = lookup(var.gcp_global, "project_name")
  region      = var.project_region
}
