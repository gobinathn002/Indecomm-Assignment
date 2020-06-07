

# Indecomm-Assignment

Requirements:
Tech Challenge
This is a ‘take-home’ test to evaluate your systems design skills, understanding of writing
modern infrastructure-as-code and understanding of modern web applications. We expect
you would spend around four hours on this piece of work, but have until after the weekend to
get it back to us. The focus should be on getting a reasonable amount of the task done well,
not all of it done poorly.
● Design a continuous delivery architecture for a scalable and secure 3 tier application.
● Create resources for all the tiers.
● The system should be deployed to AWS.
● The architecture should be completely provisioned via some infrastructure as a code
tool.
● Please fork the following repo so that all your work is under source code
management:
● https://github.com/.../example.git [we will replace this with a live git repo when it’s
available]
Once you have submitted your solution, we will review it and make a decision on whether
or not to invite you to review it with us.



Solution:- 

Architecture Approach - 

![Architecture-3 tier Web app](https://user-images.githubusercontent.com/38713873/83965637-41dbb780-a8ca-11ea-9b67-02771389efcf.PNG)

I have integreated all the Devops tools like, GIT, Jenkins, Ansible, Terraform, Docker and Kubernetes.
 1. I have created the All the AWS resources using the Infrastruture as a Code tool Terraform.
      a. I have created vpc, subnets, InternetGW, NAT GW, Route tables, Security groups, Ec2 instances.
      b. After provisioning of infra i have used ansible to install packages on to the master and worker nodes. 
2. Once the infra is ready, i have deployed jenkins and ansible servers to integreate CI/CD workflow. 
3. After that i have taken one 3 tier app to deploy to the Kubernetes cluster. 
4. I build Jenkins Maven project to complete this CI/CD process. I have defined all the steps for automating this process whenever the Devloper commits the code on the GITHUB using POLL SCM in the Jenkins JOB. 
5. I have build Docker images and push to the Docker HUB and i deployed that on to the Kubernetes cluster as a POD.
6. Created service on Kubernetes to expose the application to public.

I have kept all the files in the GITHUB respositary for this CI/CD flow.
