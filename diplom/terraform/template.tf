data "template_file" "inventory" {
    template = "${file("hosts")}"

    vars = {
        nginx1_ip = "${yandex_compute_instance.vm2.network_interface.0.ip_address}"
        proxi_ip = "${yandex_compute_instance.vm1.network_interface.0.nat_ip_address}"
        nginx2_ip = "${yandex_compute_instance.vm3.network_interface.0.ip_address}"
        elastic_ip = "${yandex_compute_instance.vm4.network_interface.0.ip_address}"  
        kibana_ip = "${yandex_compute_instance.vm5.network_interface.0.ip_address}" 
        zabbix_ip = "${yandex_compute_instance.vm6.network_interface.0.ip_address}" 
    
    }
    
}

resource "null_resource" "update_inventory" {

    triggers = {
        template = "${data.template_file.inventory.rendered}"
    }

    provisioner "local-exec" {
        command = "echo '${data.template_file.inventory.rendered}' > ./ansible/host.ini"
    }
}