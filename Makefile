# Define the image name and Docker Hub user ID
IMAGE_NAME = eric_demo
DOCKER_ID_USER = ericiortega

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):latest .

# docker run -d -p 5005:5000 --name $(IMAGE_NAME)_container $(IMAGE_NAME)

# Run the Docker container
run:
	docker run -p 5005:5000 $(IMAGE_NAME)

# Stop and remove the running Docker container
stop:
	docker stop $(IMAGE_NAME)_container || true
	docker rm $(IMAGE_NAME)_container || true
#  stop
# Remove the Docker image

clean:
	-docker ps -a -q --filter ancestor=$(IMAGE_NAME) | xargs -r docker stop
	-docker ps -a -q --filter ancestor=$(IMAGE_NAME) | xargs -r docker rm
	-docker images -q $(IMAGE_NAME) | xargs -r docker rmi -f

# Show all Docker images
image_show:
	docker images

# Show all running containers
container_show:
	docker ps -a

# Push the Docker image to Docker Hub
push: 
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