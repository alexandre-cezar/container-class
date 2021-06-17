Let's build our fist container.

From inside the Lab01 folder, run the command "docker build -t webapp:1.0 ."

After the application is finished, run the command "docker image ls" to review the images in your environment

Now, let's start our application by running "docker run -dp 3000:3000 webapp:1.0"

Go to your browser and navigate to your public instance IP and set the port to 3000, like "http://<Instance Public IP>:3000" to open your app.
