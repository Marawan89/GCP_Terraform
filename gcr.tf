locals {
    locations = ["europe-central2", "europe-west3"]
}

resource "google_cloud_run_v2_service" "gcr_service" {
    provider = google-beta
    for-each = toset(local.locations)

    name = "service-${each-key}"
    location = each.key

    template{
        scaling {
            max_instance_count = 5
            min_instance_count = 1
        }
        containers {
            image = "gcr.io/${var.project_id}/astraimage:latest"
            env {
                name = "SMTP_SERVER"
                # value = var.
            }
        }
    }
}