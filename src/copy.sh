#!/bin/sh(local machine operation)
##copy local scripts to ec2 instances.
scp -i ${PEM_FILE_PATH} ./entry.sh  ${EC2_URL}:~/mypy/
scp -i ${PEM_FILE_PATH} ./requirements.txt  ${EC2_URL}:~/mypy/
scp -i ${PEM_FILE_PATH} ./Dockerfile  ${EC2_URL}:~/mypy/
scp -i ${PEM_FILE_PATH} ./build.sh  ${EC2_URL}:~/mypy/

## put a test file to s3 for testing purpose
PY_FILE=test.py
S3_PATH=s3://${S3_BUCKET_NAME}
aws s3 cp ${PY_FILE} ${S3_PATH}/${PY_FILE}