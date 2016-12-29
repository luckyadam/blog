#!/bin/bash
rm -rf public || exit 0;
mkdir public;
if [ "$1" = "false" ]
# not a pull request, deploy to github pages
then ( cd public
  git init
  git config user.name "luckyadam"
  git config user.email "weitaozsh@gmail.com"
  echo "diao.li" > CNAME
  touch .
  git add -A .
  git commit -m "Deployed to Github Pages [skip ci]"
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
)
fi
