locals {
  source_function_files = "${path.module}/functions"
}

resource "google_storage_bucket" "bucket_functions" {
  name     = lookup(var.storage_infos_functions, "bucket_name")
  location = lookup(var.storage_infos_functions, "location")
}

resource "google_storage_bucket_object" "archive_hello_world_functions" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket_functions.name
  source = data.archive_file.hello_world_functions.output_path
}

data "archive_file" "hello_world_functions" {
  type        = "zip"
  source_dir  = "${local.source_function_files}/hello_input"
  output_path = "${local.source_function_files}/hello_output/main.zip"
}
