
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

  disk_ids = [
    yandex_compute_instance.vm1.boot_disk.0.disk_id, yandex_compute_instance.vm2.boot_disk.0.disk_id, 
  yandex_compute_instance.vm3.boot_disk.0.disk_id, yandex_compute_instance.vm4.boot_disk.0.disk_id, 
  yandex_compute_instance.vm5.boot_disk.0.disk_id, yandex_compute_instance.vm6.boot_disk.0.disk_id
  ]
             
}