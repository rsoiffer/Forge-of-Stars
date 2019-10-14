#!/usr/bin/env sh

set -e

dest=${1?please provide destination directory}

bundle exec jekyll build --destination "$dest" --trace

cd "$dest"
git add --all

git status
select choice in "Commit and Push" "Cancel"
do
    case $choice in
        "Commit and Push")
            git commit -m "Rebuild site"
            git push
            break
            ;;
        "Cancel")
            echo "Canceled."
            break
            ;;
    esac
done

cd -
