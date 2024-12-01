provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "my_service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = var.region
  service     = google_cloud_run_service.my_service.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}