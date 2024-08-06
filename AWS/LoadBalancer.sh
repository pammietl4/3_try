############  2 types LoadBalancer ###############

1) Regional based Loadbalancer-- Global LoadBalancer
2) VPC based LoadBalancer -- a)Application LoadBalancer b)Network LoadBalancer

Network LoadBalancer -- 
Mainly works on Transport Layer(Layer 4) -- 
which supports TCP & UDP(Gaming/streaming application/Teams/Zoom/Webex) protocal 
but HTTP & HTTPS are TCP protocals only however ALB will not support UDP 

Examples for TCP Protocals -- SFTP/Email/outlook/Winscp
Examples for UDP Protocols -- Teams/Zoom/Webex/Video streaming/Gaming
Explanation -- source(www.google.com) -- it will send packet to destination it will make sure it will wait for response/Aknowledgement from destination

Application LoadBalancer -- 
Mainly works on Application Layer (Layer 7) -- which supports HTTP & HTTPS


 






