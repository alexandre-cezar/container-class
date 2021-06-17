# container-class
Container Class

This repo is intended for use in the container concepts class.

To get started, simply follow the GCP instructions [here](https://cloud.google.com/free) to create a free project and after your new project is create, add a SSH key to the project instance metadata. You can find the proper instructions [here](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)

On your GCP console, active the Cloud Shell and once it activates, clone this project by running the command "git clone https://github.com/alexandre-cezar/container-class"

Navigate to the project folder and open the variables file using a text editor (vim).

Add two changes there:
  1. In the "project_name" variable, add your "project ID" 
  2. In the "instance_count" variable, modify it to match the number of instances you need for the class.

After you're finished with the changes, save it.

Initialize terraform by running the command "terraform init".

After the initialization is concluded, run "terraform plan" to visualize the changes and finally "terraform apply" to deploy the infrastructure.

Once the training is finished, remember to destroy your infrascture. You can do it by typing "terraform destroy"
