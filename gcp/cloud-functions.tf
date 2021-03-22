resource "google_cloudfunctions_function" "hello_world_function" {
  name        = "hello-world-function-test-kaiohps"
  description = "My Hello World Function"
  runtime     = "python38"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket_functions.name
  source_archive_object = google_storage_bucket_object.archive_hello_world_functions.name
  trigger_http          = true
  entry_point           = "hello_http"
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "hello_world_invoker" {
  project        = google_cloudfunctions_function.hello_world_function.project
  region         = google_cloudfunctions_function.hello_world_function.region
  cloud_function = google_cloudfunctions_function.hello_world_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
