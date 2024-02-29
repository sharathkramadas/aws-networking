* Interesting facts about EC2
	* By default it gets the `RouteTable` of the VPC 
	* By default it gets the `NetworkACL` of the VPC 
	* By default it gets the `SecurityGroup` of the VPC 
	* If you try to attach an SSH key, the instance is recreated.
	* If you try to attach an ENI, the instance is recreated.
	* Network interface is not mandatory for an EC2 for network connectivity

* Interesting facts about EIP
	* You can never attach an EIP to an EC2 instance without an Internet Gateway

* Interesting facts about Security Group
	* You can attach a Security Group to a VPC
	* You can attach a Security Group to a Network Interface
	* You can attach a Security Group to an EC2 		

* Interesting facts about VPC
	* It creates a `RouteTable` by default
	* It creates a `NetworkACL` by default
	* It creates a `SecurityGroup` by default
	* You can only attach one `InternetGateway` per VPC
	* Every Subnet created under VPC get's the same `RouteTable` created at the creation of VPC
	* You can only have 5 VPC's per AWS account
	* A VPC will never send a traffic out without an Internet Gateway

* Interesting facts about Subnet
	* By default it gets the `RouteTable` of the VPC 
	* By default it gets the `NetworkACL` of the VPC 
	* By default it gets the `SecurityGroup` of the VPC 
	* Subnet level traffic can be controlled by NACL
		* Ex :- A specific port can only have a traffic from a specific IP
	* Subnet can only be associated to a single NACL
	* Subnet will never get an internet without a route table with a route to Internet Gateway 
	* Subnet are public only if there is a `0.0.0.0/0` route to an Internet Gateway 

* Interesting facts about NACL
	* By default it allows all the Traffic, In and Out of the VPC!!!	
	* It is created when the VPC is created
	* It can be associated to multiple Subnets
	* The rules are in ascending order
		* That is rule number 100 gets evaluated before rule number 101
	* NACL inbound rule applied at VPC level will not affect any subnet unless associated
	* If you create a NACL without any rules by default it will deny both Ingress and Egress traffic
	* You will have to open inbound Ephemeral ports (1024-65535) for the system update to work

* Interesting facts about NAT Instances
	* NAT Instances are created out of NAT AMI's
	* NAT instances will always be placed in a Public subnet
	* Security groups associated with NAT should have Security Grpups route for HTTP and HTTPS for system updates to work
	* The private instance should have a network route to a NAT ENI
	* Source and Destination checks should be set to `false`
	* An EIP is needed for a NAT instance to communicate with the external world.
	* An ICMP SG rule is needed
	* An extra ENI for the NAT instance is optional

* Interesting facts about SSM
	* There should be an Amazon Linux AMI or an AMI which has SSM Agent installed
	* There should be a role with a policy called `AmazonSSMManagedInstanceCore` which gets attached to EC2
	* There should be an Egress for 443 i.e for SSM Endpoints
	* There is no need for EIP 		

* Subnet
	* Route Table
		* Routes
			* Internet Gateway
		* Route Propagation
	* Network ACL
	* Flow Logs
	* Sharing?
	* Network Interfaces
* VPC
	* DHCP
	* Route Table
	* Network ACL
	* Flow Logs
	* Internet Gateway
	* Security Groups
	* Subnet
* Route Table
	* Routes
		* Internet Gateway
	* Route Propagation 
	* Subnet Association
	* Edge Association
* NACL
	* Inbound Rules	
	* Outbound Rules	
	* Subnet Association

### References
* SSM
	* https://dev.to/aws-builders/securely-access-your-ec2-instances-with-aws-systems-manager-ssm-and-vpc-endpoints-1bli	

