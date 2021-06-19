# container-class
Cloud Native Applications Concepts and the security aspects course

This repo is intended for use in the container labs of the above course.

To get started, simply follow the GCP instructions [here](https://cloud.google.com/free) to create a free project and after your new project is created, add a SSH key to the project instance metadata. You can find the proper instructions [here](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys).
You also need to create a [Service Account](https://cloud.google.com/iam/docs/creating-managing-service-accounts) with Compute Admin permissions, generate a json key and save it on your computer.

Once you're done with the pre-tasks, naviagate to your GCP console, activate the Cloud Shell and once it's available, clone this project by running the command "git clone https://github.com/alexandre-cezar/container-class".

Navigate to the project folder and upload the Service Account key.

Open the variables file using a text editor (vim).

Add two changes there:
  1. In the "project_name" variable, add your "project ID" - You can find it [here](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
  2. In the "instance_count" variable, modify it to match the number of instances you want to create for the class.

After you're finished with the changes, save it.

Initialize terraform by running the command "terraform init".

After the initialization is concluded, run "terraform plan" to visualize the changes and finally "terraform apply" to deploy the infrastructure.

Once the training is finished, remember to destroy your infrastructure. You can do it by typing "terraform destroy"

NOTE: If you're not familiar with GCP or Terraform, simply initiate a Virtual Machine on your cloud provider of choice and execute the scripts included on the startup-script part of the terraform file that creates the instances.

The instructions for the labs are included on each lab folder.
