#!/usr/bin/env sh

set -e

dest=${1?please provide destination directory}

bundle exec jekyll build --destination "$dest" --trace

cd "$dest"
git add --all
git commit
git push
cd -
