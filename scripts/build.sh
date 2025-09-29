#!/bin/bash
# This script prepares mkdocs for a build (there are some adjustments to be made to the recipes before publishing)

# Fetch git history so that we get last-updated timestamps
# git fetch --unshallow

set -e # abort on fail
set -x # debug failed builds

# Run python build script to check for errors
# python3 scripts/build.py mkdocs.yml

brew install pngquant

# install mkdocs (or insiders version, if we're passed a GH_TOKEN var)
if [ -z "$GH_TOKEN" ]
then
  echo "No GH_TOKEN passed, doing a normal build.."
  pip install mkdocs-material
  mkdocs build -f mkdocs.yml
else
  echo "GH_TOKEN passed, doing an insiders build.."

  # Try the latest
  pip install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git
  # pip install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git@9.5.2-insiders-4.47.1
  mkdocs build -f mkdocs.yml
fi

# Setup any necessary netlify redirects
cp netlify_redirects.txt site/_redirects

