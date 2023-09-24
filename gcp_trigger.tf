resource "google_cloudbuild_trigger" "astracloud_cloud" {
  project = var.project_id  
  github {
    owner = var.user_github
    name  = var.repository_name
    push {
      branch = "^${var.repository_branch}$"
    }
  }

  filename = "cloudbuild.yaml"
}