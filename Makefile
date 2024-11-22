# Define the image name
IMAGE_NAME = eric_demo
DOCKER_ID_USER = ericiortega

# Build the Docker image
build:
	@docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
	@docker run -p 8000:80 $(IMAGE_NAME)

# Remove the Docker image
clean:
	@docker rmi $(IMAGE_NAME)

# Show Docker images
image_show:
	@docker images

# Show running Docker containers
container_show:
	@docker ps

# Push the Docker image to Docker Hub
push:
	@docker login
	@docker tag $(IMAGE_NAME) $(DOCKER_ID_USER)/$(IMAGE_NAME)
	@docker push $(DOCKER_ID_USER)/$(IMAGE_NAME):latest

# Login to Docker Hub
login:
	@docker login -u ${DOCKER_ID_USER}
