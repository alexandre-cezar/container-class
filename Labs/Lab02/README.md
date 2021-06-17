In this lesson, let's learn a little bit of container security.

First, open two SSH connections to your instance.

Now, from the Lab02 folder, run the command "docker build -t badcontainer:1.0 ."

Let's start our container by running "docker run -ti --privileged --rm badcontainer:1.0 /bin/sh"

As you may have noticed, we're inside the container now.

Run the command "head -1 /etc/mtab", which exposes the host file system path of container mounts to the container itself. 
The host file system path here would be something similar to "/var/lib/docker/overlay2/feee143c8cabf326a8b1b79663f12e55062493da30b46166b46de7d832d1894b/diff"

Now let's create a new file in this mount by issuing the command "echo "I am a bad container" > /findme and "sed -n 's/.*\perdir=\([^,]*\).*/\1\/findme/p' /etc/mtab"

Finally, let's see the file at the host. From your second SSH terminal on the container host, using the overlayfs mount path to cat the file,
run the command "sudo cat "your host file system path"/findme" and check the command response.

An example would be "sudo cat /var/lib/docker/overlay2/feee143c8cabf326a8b1b79663f12e55062493da30b46166b46de7d832d1894b/diff/findme"
