#!/bin/bash
set -eu

echo "Current build profile is ${BUILD_PROFILE}"

BUILD_DIR=$HOME/build
DIST_DIR=$HOME/distribution

rm -rf ${DIST_DIR}/*
mkdir -p ${BUILD_DIR}

cd $HOME/repo
git archive --format=tar ${GIT_BRANCH} | tar -C ${BUILD_DIR} -xf -

cd ${BUILD_DIR}
gradle build

cp subproject1/build/libs/subproject1.jar ${DIST_DIR}/
cp subproject2/build/libs/subproject2.jar ${DIST_DIR}/
