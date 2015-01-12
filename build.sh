#!/bin/bash
hexo clean || exit 0;
mkdir public;
hexo optimize;
if [ "$1" = "false" ] 
# not a pull request, deploy to github pages
then ( cd public
  git init
  git config user.name "luckyadam"
  git config user.email "weitaozsh@gmail.com"
  git add .
  git commit -m "Deployed to Github Pages [skip ci]"
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
)
fi
