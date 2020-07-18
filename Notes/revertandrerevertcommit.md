# How to revert a commit ?
Execute - git log
- this will display all the commit hash against your branch

- To revert any commit -
git revert {hash commit from above step}

# How to undo the revert operation
git cherry-pick {hash commit from above step}

# If you haven't pushed that change yet, 
git reset --hard HEAD^

- git rebase to drop revert commit. 