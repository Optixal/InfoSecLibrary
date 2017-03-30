# Flow of Docker
1. Create Dockerfile (optional, can skip to step 3 to configure through arguments)
2. Build a new image with `docker build -t "IMAGENAME" .`
  * The image is read-only with the specified configurations written in the Dockerfile
3. Run an instance (container) of the newly built image with `docker run -dt -p 8123:80 --name "CONTAINERNAME" "IMAGENAME"`
  * Container is now active.
  * List active containers with `docker ps`
  * List all containers with `docker ps -a`
  * List all images with `docker images`
  * Repeat this step to create more instances (containers) of the same image
4. Stop container with `docker stop "CONTAINERNAME"`
5. Delete container with `docker rm "CONTAINERNAME"`
  * Repeat this step to delete all instances of the image
6. Delete image with `docker rmi "IMAGENAME"`
