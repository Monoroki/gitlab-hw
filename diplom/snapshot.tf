terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
token = var.tocken
cloud_id = "b1g5o782lnoiooh0i32j"
folder_id = "b1gimokv8g2uegfmqvo7"  

zone = "ru-central1-a"

}

resource "yandex_compute_snapshot_schedule" "mysnapshot" {
  name = "snapshot"

  schedule_policy {
    expression = "0 1 * * *"
  }

  snapshot_count = 7

  snapshot_spec {
      description = "Daily snapshot"
 }

  retention_period = "168h"

  disk_ids = ["epdd0j3k0mmk9fckou7f", 
             "ef3vo93fh0mabjeb8mu1",
             "epdmlikbrnvbvonnjqmf",
             "epdrkpn04aso6l6a05nj",
             "epdle8gkno77t3klifb4",
             "fhmcocic4c0gc9nc7q88"]
}