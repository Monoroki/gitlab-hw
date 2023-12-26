resource "yandex_vpc_network" "diplom-net" {
  name = "dilpom-net"
}

resource "yandex_vpc_subnet" "subnet-a" {
  name           = "sub-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.diplom-net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_subnet" "subnet-b" {
  name           = "sub-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.diplom-net.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

resource "yandex_vpc_subnet" "subnet-c" {
  name           = "sub-c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.diplom-net.id
  v4_cidr_blocks = ["192.168.30.0/24"]
route_table_id = yandex_vpc_route_table.rt.id
}


resource "yandex_vpc_gateway" "nat_gateway" {
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  name       = "routetable"
  network_id = yandex_vpc_network.diplom-net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}