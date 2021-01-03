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

echo "But not all of A is used by each other project..."
pushd b && elm-review && popd

