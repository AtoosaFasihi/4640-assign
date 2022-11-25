# 4640-assign
assignment_1

Make sure you have terraform installed to be able to replicate the configuration

To install terraform use the link bellow: 
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## To replicate the configuration on a new machine follow these instructions: 

* clone this ripo on your directory
* Your file structure should look similar to the picture bellow:

![file-setup](https://user-images.githubusercontent.com/71790429/203901263-a69618a7-9ec3-4e01-9e72-9300ea10f091.JPG)

Information about the file structure in this assignment: 

`- main.tf(provider info)
- variables.tf(variables, anything that you use twice, or could change(region, size…) )
- terraform.tfvars(variable values)
- output.tf(any output blocks, like ip addresses, and database connection uri)
- database.tf (includes db firewall)
- servers.tf(your droplets, load balancer and firewall for your servers)
- bastion.tf(includes firewall for bastion server)
- network.tf (your vpc)
- data.tf(data blocks, like your ssh keys)
- .env` 

# Configure Terraform 

* create a new API token on Digitalocean 
* create a .env file in the same directory 
* copy your token and paste it to the .env file like: 
`export TF_VAR_do_token=<my API tocken>`

* source your .env file by running 

```source .env```

* To complete this assignmnent first run this command: 

`terraform init`

* you can check the validation of the main.tf file by running:

`terraform validate`

* After the configuration is valid you can run `terraform plan` to see what will be created using terraform.

* To apply all the changes simply run `terraform apply` 

![image](https://user-images.githubusercontent.com/71790429/203902875-8fe0d644-0347-4937-aa04-9496e855a16d.png)

Note: This step might take a few minutes. 


# Testing

## test that we can connect to bastion server:
* Run `ssh -A root@<publicIP_bastion_server>`

![image](https://user-images.githubusercontent.com/71790429/203903214-fee55f3c-502a-40fc-aa2c-f2af298a5f7b.png)

## Test the we can connect to the database(MongoDB): 

* To do this we need to temporarly remove "Web" tag from trusted hosts to allow access from anywhere

* To connect to the database we need the "database connection string" whcih can be found in the digitalocean console

* We can also find the password of our database in the  terraform.tfstate file

* We can use MongoDB Compass App to connect to the database by pasting the database connection string and the right password:

![image](https://user-images.githubusercontent.com/71790429/203903891-f22f6db5-be6d-4481-983c-eab8cd6ae48b.png)

* After the connection was successfull, add the "Web" tag back to the trusted hosts

* After testing everything you can run `terraform destroy` to destroy all the resources that were created. 
