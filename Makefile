# Define the image name and Docker Hub user ID
IMAGE_NAME = eric_demo
DOCKER_ID_USER = ericiortega

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
	docker run -d -p 8000:80 --name $(IMAGE_NAME)_container $(IMAGE_NAME)

# Stop and remove the running Docker container
stop:
	docker stop $(IMAGE_NAME)_container || true
	docker rm $(IMAGE_NAME)_container || true

# Remove the Docker image
clean: stop
	docker rmi $(IMAGE_NAME)

# Show all Docker images
image_show:
	docker images

# Show all running containers
container_show:
	docker ps -a

# Push the Docker image to Docker Hub
push: login
	docker tag $(IMAGE_NAME) $(DOCKER_ID_USER)/$(IMAGE_NAME):latest
	docker push $(DOCKER_ID_USER)/$(IMAGE_NAME):latest

# Docker login
login:
	docker login -u $(DOCKER_ID_USER)


# # Define the image name
# IMAGE_NAME = eric_demo
# DOCKER_ID_USER = ericiortega

# # Build the Docker image
# build:
# 	docker build -t $(IMAGE_NAME) .

# # Run the Docker container
# run:
# 	docker run -p 8000:80 $(IMAGE_NAME)

# # Remove the Docker image
# clean:
# 	docker rmi $(IMAGE_NAME)

# image_show:
# 	docker images

# container_show:
# 	docker ps

# push:
# 	docker login
# 	docker tag $(IMAGE_NAME) $(DOCKER_ID_USER)/$(IMAGE_NAME)
# 	docker push $(DOCKER_ID_USER)/$(IMAGE_NAME):latest

# login:
# 	docker login -u ${DOCKER_ID_USER}