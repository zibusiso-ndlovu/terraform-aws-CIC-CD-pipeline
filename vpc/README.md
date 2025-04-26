Introduction

The importance of secure and effective networking in the cloud cannot be overemphasized. In this article, we will go over some introductory elements of AWS networking with the VPC(Virtual Private Cloud) as its base. We will also go over the installation of the VPC using a Terraform script.

Architectural Overview

In the AWS Cloud, an Amazon Virtual Private Cloud(Amazon VPC) is an isolated virtual network that resembles a traditional network that you’d operate in your own data center. Security and scalability can be built with a good networking foundation with a VPC.

We will discuss the following VPC Architecture Diagram

The basic VPC set up illustrated above shows that a VPC is contained within a single Region. A Region is a separate geographic area where AWS Cloud data centers reside. Each region is isolated from every other region. Each region is typically made up of separate isolated locations called Availability zones. Availability zones allow you to build highly available applications by having redundant capabilities where if there are outages in one availability zone your workload can still operate.

AWS VPCs have a specific range of IP addresses and within the VPC there are subnets. Subnets are defined by a range of IP address in your VPC.

In the example above, we see that there are public subnets and private subnets.

Public subnet — the subnet has a direct route to an internet gateway. Resources can access the public internet

Private subnet — The subnet does not have a direct route to an internet gateway. Resources in a private subnet require a NAT device to acess the public internet (Likely for patching or 3rd party service access)

VPN-only subnet — The subnet has a route to a SIte-to-Site VPN connection for a virtual private gateway. Not having a route to an internet gateway

Isolated subnet — The subnet has no routes to destinations outside its VPC. Resources in an isolated subnet can only be acess or be accessed by other resource in the same VPC.

Internet Gateway — This is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet. It supports IPv4 and IPv6 traffic. Resources in the public subnets can access the internet.

Security benefits

In an AWS region, there are Default VPCs which come with a public subnet in each availability zone. These default VPCs are suitable for launching public instances and getting something working quickly that is not that critical.

However, by creating a custom VPC, you can ensure more secure access and customize it to your own workload to ensure a higher level of security. Once you have selected the right region(Generally close to your user base) and the number of availability zones, you can ensure that it is highly available across multiple availability zones.

Hands On with Terraform!

We will now go through how to deploy this VPC set up to your own AWS Account. Now if you have not set yourself up, you can refer to Deploying AWS Infrastructure with Terraform to ensure you have all that is required to be able to do this section.

variables.tf — defines input variables that can be configured during deployment

outputs.tf — defines output values that are exposed after infrastructure creation

providers.tf — specifies the providers (like AWS, Azure, GCP) and their configurations

internet_gateway.tf, route_table.tf, subnets.tf, vpc.tf — define the individual network resources to create the vpc

Let us get started in a command prompt that has been authenticated to your AWS Account.

Step 1: Download the code from the Terraform repository

Step 2: Ensure your command line is configured to have access to your environment with “aws sts get-caller-identity --query Account --output text” (There are 2 hyphens befor query and output)

Step 3: Go to the vpc folder from the repository on your machine


Step 4: terraform init

Step 5: terraform validate


Step 6: terraform plan


Step 7: terraform apply (and type in Yes to “Enter a value:)


When the terraform apply has completed you will see the following output (as defined in the outputs.tf file):


Verification in the AWS Console

We have deployed a VPC with 3 public subnets and 3 private subnets. This can be seen in the AWS Console under the VPC section

