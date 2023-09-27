#!/bin/bash

rm -rf kmsxx

git clone --depth 1 git@github.com:tomba/kmsxx.git

pushd kmsxx
git apply ../pypatch.patch
popd
