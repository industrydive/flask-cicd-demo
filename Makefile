.PHONY: build release deploy cluster

cluster:
	gcloud container clusters get-credentials cluster-1 --zone us-east4-a --project test-cluster-174217

build:
	docker build -t us.gcr.io/test-cluster-174217/demoapp:latest .

push:
	gcloud docker -- push us.gcr.io/test-cluster-174217/demoapp:latest

release: |build push

deploy: |cluster release
	helm upgrade demoapp-release ./deploy/demoapp-chart --set image.tag=latest -f deploy/custom-values.yaml -i
