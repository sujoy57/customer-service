terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket0112"
    prefix = "terraform/state"
  }
}
