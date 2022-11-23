data "digitalocean_ssh_key" "river_ssh_key" {
  name = "river"
}

data "digitalocean_project" "lab_project" {
  name = "first-project"
}
