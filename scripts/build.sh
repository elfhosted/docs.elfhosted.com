#!/bin/bash
# This script prepares mkdocs for a build (there are some adjustments to be made to the recipes before publishing)

# Fetch git history so that we get last-updated timestamps
# git fetch --unshallow

set -e # abort on fail
set -x # debug failed builds

# Run python build script to check for errors
# python3 scripts/build.py mkdocs.yml

# brew install pngquant
pip install mkdocs-material

# Setup any necessary netlify redirects
cp netlify_redirects.txt site/_redirects

