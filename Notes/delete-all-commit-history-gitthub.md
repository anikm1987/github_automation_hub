# how to delete all commit history in github?
- Checkout
  git checkout --orphan latest_branch

- Add all the files
  git add -A

- Commit the changes
  git commit -am "backup master"

- Delete the master branch
  git branch -D master

- Rename the current branch to master
  git branch -m master

- Force update your repository
  git push -f origin master