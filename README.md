# Create a nginx AWS box Ubuntu on AWS Using Packer

Using Packer to build an AWS image. The AMI will be an image of Ubuntu that has nginx installed.

## Pre-requisites

* You must have [Packer](https://developer.hashicorp.com/packer/tutorials/aws-get-started/get-started-install-cli#installing-packer) installed on your computer. 
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).


## Quick start

### Set the AWS environment variables:

Configure your [AWS access 
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as 
environment variables:
```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

### Clone the repository:

```
git clone git@github.com:margiran/Packer_Ubuntu_Nginx_AWS_AMI.git
cd Packer_Ubuntu_Nginx_AWS_AMI
```
### Initial and build image in AWS using Packer:

```
packer init .
packer build .
```

### Sample output

```
packer init .
```
Installed plugin github.com/hashicorp/amazon v1.1.6 in "/Users/mohammad/.config/packer/plugins/github.com/hashicorp/amazon/packer-plugin-amazon_v1.1.6_x5.0_darwin_arm64"

```
packer build .
```

==> ubuntu-nginx.amazon-ebs.ubuntu-nginx: Prevalidating any provided VPC information  
    .
    .
    .
    ubuntu-nginx.amazon-ebs.ubuntu-nginx: Setting up fonts-dejavu-core (2.35-1) ...
    ubuntu-nginx.amazon-ebs.ubuntu-nginx: Setting up fontconfig-config (2.11.94-0ubuntu1.1) ...
    .
    .
    .

==> Wait completed after 4 minutes 34 seconds

==> Builds finished. The artifacts of successful builds are:
--> ubuntu-nginx.amazon-ebs.ubuntu-nginx: AMIs were created:
us-west-2: ami-xxxxxxxxxxxxx
