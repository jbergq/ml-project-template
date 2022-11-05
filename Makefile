PROJECT_ID=new_project
IMAGE_ID=new_project_image
VERSION_ID=v1.0
REGISTRY_URI=some_registry
IMAGE_URI=$(REGISTRY_URI)/$(PROJECT_ID)/$(IMAGE_ID):$(VERSION_ID)

build:
	docker build . -t $(IMAGE_URI)
run:
	docker run $(IMAGE_URI)
push:
	docker push $(IMAGE_URI)
check:
	flake8 .
	mypy .
format:
	black .
	isort .
env-create:
	mamba create --name $(PROJECT_ID) python=3.8
env-install:
	mamba env update --file req/environment.yaml
env-activate:
	conda activate $(PROJECT_ID)
env-save:
	conda env export --from-history | grep -v "^prefix: " > req/environment.yaml