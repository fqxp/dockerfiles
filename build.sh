#! /bin/bash

function build_container() {
  DOCKERFILE_DIR=$1
  IMAGE_NAME="fqxp/$(basename $DOCKERFILE_DIR)"

  echo "########################################"
  echo "Building $IMAGE_NAME ..."
  docker build -rm -t $IMAGE_NAME $DOCKERFILE_DIR
}

if [ $# = '0' ]; then
  for DOCKERFILE in */Dockerfile; do
    DOCKERFILE_DIR=$(dirname $DOCKERFILE)
    build_container $DOCKERFILE_DIR
  done
else
  for DOCKERFILE_DIR in $@; do
    build_container $DOCKERFILE_DIR
  done
fi

