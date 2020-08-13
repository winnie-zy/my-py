#!/bin/sh
##
cp -rf ~/.aws/credentials ./credentials  ##copy .aws/credentials on EC2 instance to ./credentials(Docker workfolder) for building docker image.
docker build -t mypy:latest . ##build docker image.load from local dir with Dockerfile.
docker tag mypy:latest ${ECR_REPO}/mypy:latest ##tag the imge
docker push ${ECR_REPO}/mypy:latest ##push the image to ECR(tag coincidences with URL)