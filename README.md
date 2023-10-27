# terraform-aws
Dip a toe in Terraform


### Getting Started
This Terraform project is configured with AWS s3 backend, creating of the state file folder in AWS is also configured in `/prerequisite`

### Install Terraform
```
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform 
```
Make sure [_aws cli_](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) is also installed and profile is configure,
<!-- 
### tab content Long-term Credential
`~/.aws/credential`
```
[user1]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
```
`~/.aws/config`
```
[profile profileName]
region=us-east-1
output=text
```
### tab content SSO -->

in `$ vi ~/.aws/config`
```
[profile <profile-name>]
region = <us-east-1>
output = <json>
sso_session = <my-sso>
sso_account_id = <111122223333>
sso_role_name = <readOnly>
```
> _profile-name will be used as stage name, e.g. dev, staging_


### Create the state bucket in AWS
```
$ cd prerequisite
prerequisite $ terraform init
```

### Initiate workspace
```
$ cd ..\main
main $ terraform workspace new <workspace-name>
```
> _workspace-name should be consistent with aws profile name, as it will be used to match profile names of AWS config_

### Apply Terraform scripts
```
$ terraform apply -auto-approve
```
