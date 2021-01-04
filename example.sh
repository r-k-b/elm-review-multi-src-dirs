#!/usr/bin/env bash

set -e

echo "Each project compiles OK..."

pushd a
echo "A:"
elm make src/MainA.elm --output=/dev/null
popd
pushd b
echo "B:"
elm make src/MainB.elm --output=/dev/null
popd
pushd c
echo "C:"
elm make src/MainC.elm --output=/dev/null
popd

echo
echo "Because we have manually imported all modules, elm-review treats them as
belonging to a single module, eliminating the false-positive while still
detecting the true-positive of 'thisIsNeverUsed':"
echo
pushd b
elm-review src/MainB.elm ../a/src/MainA.elm ../c/src/MainC.elm
popd

