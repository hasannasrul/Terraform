#VPC Explanation

###How this VPC setup Work

```
When you try to access google.com from inside your EC2 instance that is located in a subnet(prod-subnet) within your VPC (production), the following steps will occur:

> Your instance will send a request to its network interface ().

> The security group associated with the network interface will check if the outbound traffic to the internet is allowed or not. If it is allowed, the request will be passed to the next step.

> The route table associated with the subnet where the instance resides will be checked to see if there is a route to the internet (0.0.0.0/0).

> If there is a route, the request will be forwarded to the internet gateway attached to the VPC.

> The internet gateway will then forward the request to the destination IP address (in this case, google.com), and the response will follow the same path back to your EC2 instance.


So in short, the data flow is from the EC2 instance, through the network interface, security group, route table, internet gateway, and then out to the internet.
```
