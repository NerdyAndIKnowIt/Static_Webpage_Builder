# Static_Webpage_Builder 
Version 0.01 (not working yet)
### Terraform template that builds all infrastructure needed for a simple static website on AWS, minus domain registration

Creates the following resources:
- Route 53 hosted zone and DNS records
- S3 bucket
- Cloudfront CDN distribution
- SSL certificate with AWS Certificate Manager

## How to use:

### Prerequisites:
1. AWS account
2. AWS CLI installed and configured with the AWS account
3. Terraform installed
4. static website assets

### Main Steps
1. Register the domain you want in Route53 using the AWS console: https://aws.amazon.com/console/
2. Go to the Static_Webpage_Builder directory. In the declare_variables.tfvars file, edit the domain_name variable to the domain you just registered and change the other variables as necessary.
3. In the command prompt/terminal, initialize Terraform using the "terraform init" command.
4. Apply the Terraform template using the "terraform apply -var-file=infrastructure/declare_variables.tfvars" command.
5. Add the website files to the "website" folder, make sure the index file name matches the file name in the declare_variables.tfvars tile (index.html is the default)
6. In the command prompt/terminal, change the working directory to be inside the site folder
7. upload the website files to S3 using this command: aws s3 sync dist s3://(your full domain name)

Changelog:
- V0.01 added S3 and route 53 zones, trying to get a public S3 bucket working before adding cloudfront and the SSL cert