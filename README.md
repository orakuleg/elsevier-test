# AWS S3 Static Website Terraform Module
Terraform Module for an Amazon S3 Static Website, fronted by a CloundFront Distribution.
Terraform project for an AWS. Will create following things: 
- Two buckets.
- CDN.
- Route 53.

Required:
- Own domain.
- Certificate imported into AWS.

Project still in development - see [TODO section](#todo).

## Features
This module allows for [Hosting a Static Website on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html), provisioning the following:

- S3 Bucket for static public files
- S3 Bucket for redirect
- CloudFront Distribution fronting the S3 Bucket
- Route 53 Record Set aliased to the CloudFront Distribution
- CloudFront Distribution configured to redirect http to https.
- You can configure access to S3 using IP addresses ( useful for different environments )

## ToDo
It requires (for now?) that the following have been setup outside this module:
- SSL Certificate
- Route 53 Hosted Zone
- Own Domain

As well, could be easily improved:
- Security.
- Network Routing.

## Usage
```
Initial procedure:
- Lets initialize a working directory:
-- terraform init 

- Let create wokrspace for each environment and apply infrastructure:
- For dev:
-- terraform wokspace new dev && terraform apply -var-file="secrets.tfvars" -var-file="dev.tfvars"
- For production:
-- terraform wokspace new production && terraform apply -var-file="secrets.tfvars" -var-file="production.tfvars"
- After that you will be able to switch workspaces with command:
-- terraform workspace select dev/production
```

## Examples
- dev environment: https://dev.biserov-test.nl/ https://www.dev.biserov-test.nl/ 
- production environment: https://biserov-test.nl/ https://www.biserov-test.nl/

###### NOTE:
###### Additionally, you must provide file  secrets.tfvars containing aws_access_key and aws_secret_key.
###### For your subdomain (for example dev.biserov-test.nl ) terraform will create a new hosted zone called as domain ( dev.biserov-test.nl ). <br/> And if you want to use this hosted zone too, then you need to specify additional NS records in your main hosted zone, and they must be targeted to namesevers from your subdomain.