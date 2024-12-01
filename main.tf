provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "cloud_run_service" {
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
  service     = google_cloud_run_service.cloud_run_service.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}

variable "project_id" {
	default = "894266588013"
}
variable "region" {
	default = "europe-west1"
}
variable "service_name" {
	default = "customer-service-v1"
}
variable "image" {
	default = "europe-west1-docker.pkg.dev/ethereal-shine-443212-d0/demo/customer-service-v1:latest"
}
