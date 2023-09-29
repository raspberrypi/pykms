#!/bin/bash

rm -rf kmsxx

git clone $1 kmsxx
pushd kmsxx

git checkout $2
git apply $3

popd
