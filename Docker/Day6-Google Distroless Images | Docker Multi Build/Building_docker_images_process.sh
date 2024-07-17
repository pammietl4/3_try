Step1 -- Developer will devlop the code
Step2 -- Code will be tested (SAST) via SonarQube/Checkmarx
Step3 -- once the code is tested, it is free from Vulnurabilities we can (build) this code into a War/Jar file (Artifact) using Maven
Step4 -- we need to wirte a docker file to copy this Artifact into container
Step5 -- we need to build the docker image using above docker file
Step6 -- Once docker image is build. we need to push this image into docker hub/Amazon ECR

