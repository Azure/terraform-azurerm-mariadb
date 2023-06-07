package test

import (
	"database/sql"
	"fmt"
	"testing"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

//verifyMariaDb method that will try to insert and get some
//data drom de created database
func verifyMariaDb(user, pass, serverName string) error {
	connString := createConnectionString(user, pass, serverName)
	db, err := sql.Open("mysql", connString)
	defer db.Close()

	return err
}

//creaConenctionString method that will be used to create connection string
func createConnectionString(user, pass, serverName string) string {
	conString := fmt.Sprintf("%s:%s@jdbc(%s.mariadb.database.azure.com:3306)/defaultdb", user, pass, serverName)
	return conString
}

func TestTerraforMariaDB(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./fixture",
	}

	//will run in the end of the method, destroying all the resources that
	//terraform has created
	defer terraform.Destroy(t, terraformOptions)

	//init and aplly terraform
	terraform.InitAndApply(t, terraformOptions)

	//getting the variable values to construct connectionString
	username := terraform.Output(t, terraformOptions, "administrator_login")
	password := terraform.Output(t, terraformOptions, "administrator_login")
	serverName := terraform.Output(t, terraformOptions, "server_name")

	err := verifyMariaDb(username, password, serverName)

	if err != nil {
		t.Fatal("Problems on testing the MariaDB database")
	}
}
