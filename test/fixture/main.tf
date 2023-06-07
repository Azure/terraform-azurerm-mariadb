module "mariadb" {
  source = "../../"

  server_name = "mariadb-server"
  administrator_login = "awesomeadmin"
  administrator_password = "awesomepass12345!@#$%"
  resource_group_name = "mariadb-rg"
  location = "East US"

}
