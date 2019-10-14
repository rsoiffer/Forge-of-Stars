#!/usr/bin/env sh

set -e

saved_dest="$(dirname "$0")/.deploydest"
if [ "$1" ]
then
    dest="$(cd "$1" && pwd)"
    echo "$dest" > "$saved_dest"
elif [ -f "$saved_dest" ]
then
    dest="$(cat "$saved_dest")"
else
    echo "Please provide destination directory:"
    echo "$0 destination"
    exit 1
fi

bundle exec jekyll build --destination "$dest" --trace

cd "$dest"
git add --all

if [ -z "$(git status --porcelain)" ]
then
    echo "No changes made."
else
    git status
    
    select choice in "Commit and Push" "Cancel"
    do
        case $choice in
            "Commit and Push")
                git commit --message="Rebuild site"
                git push
                break
                ;;
            "Cancel")
                echo "Canceled."
                break
                ;;
        esac
    done
fi

cd - > /dev/null
