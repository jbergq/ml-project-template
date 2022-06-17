PROJECT_ID="gcp-explore-353012"
IMAGE_ID="test"
VERSION_ID="v1"
IMAGE_URI="gcr.io/$(PROJECT_ID)/$(IMAGE_ID):$(VERSION_ID)"

projects:
	gcloud config list --format 'value(core.project)'
auth:
	gcloud auth configure-docker
build:
	docker build . -t $(IMAGE_URI)
run:
	docker run $(IMAGE_URI)
push:
	docker push $(IMAGE_URI)
