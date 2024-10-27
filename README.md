# Static_Webpage_Builder 
Version V1.00
### Terraform template that builds all the virtual infrastructure needed for a secure static website on AWS in a few simple steps!

Creates the following resources and has the following features:
- Looks up an existing Route 53 DNS hosted zone and adds an A record to it, which points to the Cloudfront distribution.
- S3 bucket for storage with public access blocked.
- Automatically uploads your website files to the S3 bucket.
- Cloudfront distribution for caching and content delivery.
- AWS Certificate Manager for an SSL certificate.

*NOTE: Incase it needs to be said, using this template costs money for all the resources that are provisioned.*

## How to use:

### Prerequisites:

1. Create an AWS account if not done already. 
2. Install and configure the AWS CLI on your computer if not done already.
3. Create a Hashicorp account if not done already.
4. Install and configure Terraform on your computer using your Hashicorp account if not done already.
5. Install git OR git bash if you are on Windows if not done already. 


### Main Steps

1. Confirm the AWS S3 bucket name is available. The bucket name must be the exact same as the
 Fully Qualified Domain Name (example.com). To see if the bucket is available, please run
 this command in the command prompt: aws s3api head-bucket --bucket example.com
2. If that previous command returns a 'Not Found' error, the bucket should be available. If the command returns a "Forbidden" error, the bucket is probably taken and you must pick a different name.
3. Check if the desired domain is available using AWS Route 53 by searching the desired domain name, then follow the prompts to purchase and complete the domain registration: https://us-east-1.console.aws.amazon.com/route53/domains/home#/DomainSearch
4. In terminal OR git bash for Windows go to the directory you wish to use Terraform by using this command: cd C:\the\path\to\your\folder
5. Import the github repository to the desired location on your computer using this command in terminal OR git bash for Windows: git clone github.com/NerdyAndIKnowIt/Static_Webpage_Builder
6. Place the static website assets inside the static_webpage_builder/website directory
7. In the declare_variables.tfvars file, edit the index file and domain name variables. The index file is the first file that users will be directed to in your website in the static_webpage_builder/website directory. The domain is the fully qualified domain name that you registered in step 3. Be sure to leave the "quotes" around each variable.
8. In the command prompt/terminal in the static_webpage_builder directory, initialize Terraform using this command: terraform init
9. Run this command to check for any errors before deployment: terraform plan
10. Apply the Terraform template using this command, YOU MUST INCLUDE THE TFVARS FILE LIKE SO: terraform apply -var-file=declare_variables.tfvars
11. Please be paitent, the deployment may take 10 minutes or longer.


### How to delete the provisioned resources

1. In the Static_Webpage_Builder directory, run this command: terraform destroy -var-file=declare_variables.tfvars
2. Please be patient, the destruction may take 10 minutes or longer.
3. This terraform template does not support registering and unregistering domains, this must be done through the AWS console. Go here to unregister the domain: https://us-east-1.console.aws.amazon.com/route53/domains/home#/

#### Changelog:
- V0.01 added S3 and route 53 zones, trying to get a public S3 bucket working before adding cloudfront and the SSL cert
- V0.02 10/18/24 added acm, cloudfront, route 53, S3 and lots of debugging. Updated instructions.
- V0.03 10/25/24 removed domain registration after several failed tests
- V1.00 10/26/24 first working version, corrected s3.tf and cloudfront.tf webhosting issues