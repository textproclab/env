# Docker lab environment

This repository provides the Docker container for our standard lab
environment, consisting of Python 3 on Linux.

Using this image helps ensure that things will run the same on any physical
system.

## Set up

1. Install Docker on your computer:
  - [macOS](https://docs.docker.com/docker-for-mac/install)
  - [Debian](https://docs.docker.com/engine/installation/linux/docker-ce/debian)
  - [Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu)
  - [Windows](https://docs.docker.com/docker-for-windows/install)
2. Launch Docker.
3. In Docker > Preferences > Advanced, increase the available resources to
   improve performance. For instance, you may want to allocate at least 4 GB
   of RAM.
4. Build the Docker image: `./build`
5. Run the Docker container: `./run`

This will make the directory `Env` in your home directory and map it to the
`/mnt` directory inside the container so that you can share files between
the host OS and the container. You can specify whatever directory you prefer
to share, but be sure to provide the full path.

Any commands you run are in this Terminal are now running inside the Docker
container. To close the running container, either type Ctrl-d inside the
container or `docker stop textproc` from any other terminal.

For convenience, in the image, you can start a new Jupyter notebook session
by typing `jp`, which you can open at `http://localhost:9999`.

For additional sessions in the Docker container, open another terminal and
run `docker exec -it textproc bash`.
