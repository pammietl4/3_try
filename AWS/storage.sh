############  AWS STORAGE  ###########
1. Block storage   -- a) instance storage   b) EBS Volumes
2. File storage    -- a) AWS EFS (Linux)    b) AWS FSx (Windows)
3. object storage  -- a) S3 (unstructed data)   b) Glacier (Archival data)
 
********* Block storage  *************
a) Instance storage -- by default while creating Ec2 instance it will alocate some storage (8 GB)
Note -- in this case size & type of the storage is fixed
Note -- whenever you have restarted the system, the data which you have saved is lost

b) EBS Volumes  -- external data(Hard disk) which it can extend up to 16TB -- there are 2 types of hard disk a)HDD b)SSD
HDD Types -- sc1, sct, standard
SSD Types -- GP2, GP3, IO1, IO2
Advantage of EBS volume -- it can be detach & attach to other instances
Disadvantage  -- EBS volumes are availablility independent zone -- Incase if you created EBS volume in (ap-south-1a) then you want it to move to (ap-south-1b) is not possible


