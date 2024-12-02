variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "service_name" {
  description = "Cloud Run Service Name"
  type        = string
}

variable "image" {
  description = "Cloud Run Service Image Name"
  type        = string
}