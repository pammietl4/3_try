#list aws ec2 instances in <ap-southeast-1>
aws ec2 describe-instances --region=ap-southeast-1

#list aws ec2 instances in <ap-southeast-1> & copy into a file
aws ec2 describe-instances --region=ap-southeast-1 >ec2-singapore.sh

#list VPC via aws cli
aws ec2 describe-vpcs

#list VPC via aws cli in <ap-southeast-1>
aws ec2 describe-vpcs --region=ap-southeast-1

#list subnets in <ap-southeast-1>
aws ec2 describe-subnets

#list subnets & save it in a file
aws ec2 describe-subnets --region=ap-southeast-1 > subnet_hyd.sh