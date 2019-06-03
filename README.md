# Terraform Module for MariaDB on Azure

Terraform module to create a managed instance of a database in MariaDB on Azure.

## Usage
Using this module is pretty simple and really straightforward. Use like this:

``` hcl
module "mariadb" {
  source = "../../"

  server_name = "mariadb-server"
  administrator_login = "awesomeadmin"
  administrator_password = "awesomepass12345!@#$%"
  resource_group_name = "mariadb-rg"
  location = "East US"

}
```

## Running tests
In order to run the tests, I created two ways of doing that: Native and using Docker,
and I'm explaining how to run each one of these down below.

### Configuring
In order to configure Terraform on your machine and use it against Azure, you can
follow this [official Azure docs](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure).

### Local

#### Prerequisites
To run the tests locally in your machine, there are two things you need to install?

- [Terraform **(~> 0.11.7)**](https://www.terraform.io/downloads.html)
- [Golang **(~> 1.10.3)**](https://golang.org/dl/)

#### Run test (Native)
I added a script called ```test.sh``` in order to make testing the module easier.

There are two ways of running this script:
- **validate**: this mode will check if the terraform you have is a valid one. Besides,
it will check for go dependencies that we are using for testing the module.
- **full**: will execute all the validate steps and will run the integration tests using
terratest. It will create the infrastructure and do some testing with it. Note: when 
running the full command, be sure that you have followed the official docs mentioned above
and authorized your command line to create resources on Azure.

So, to test, make the script executable:

``` bash
chmod +x test.sh
```

Then, just run with the desired option. It can be one of both ways below:

##### Validate

``` bash
./test.sh validate
```

##### Full

``` bash
./test.sh full
```

### Docker

#### Prerequisites
The only dependency needed to run the tests on Docker, is the [Docker](https://www.docker.com/community-edition#/download) 
itself. For performing the tests on Docker, we are using the 
```microsoft/terraform-test``` Docker hub image which adds additional tools / packages
specific for this module (see Custom Image section).  Alternatively use only the
`microsoft/terraform-test` Docker hub image 
[by using these instructions](https://github.com/Azure/terraform-test).

#### Build the image
Before running the tests on Docker, you need to build the Docker image. To do that, run:

``` bash
docker build -t <name-you-want-for-the-image> .
```

#### Run test (Docker)

This runs the Docker validation:

```bash
$ docker run --rm <name-you-gave-to-the-image> /bin/bash -c "./test.sh validate"
```

This runs the full tests (deploys resources into your Azure subscription):

``` bash
$ docker run -e "ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID" -e "ARM_CLIENT_ID=$ARM_CLIENT_ID" -e "ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET" -e "ARM_TENANT_ID=$ARM_TENANT_ID" --rm <name-you-gave-to-the-image> bash -c "./test.sh full"
```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Credits
To create this repository, I followed the patterns and practices from the 
[postgresql module for Azure](https://github.com/Azure/terraform-azurerm-postgresql/).
If you are willing to develop a terraform module, this repo is a nice way to start.