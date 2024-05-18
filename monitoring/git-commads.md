To initialize the git repo
```
git init
```

To add a file 
```
git add -f <filename>
```

To commit 
```
git commit -m "Commit message"
```

To have history of commits and their message, commitId, date, and time
```
git log
```

To go to the particular commit
```
git reset ---hard <commitId>
```


master(up to date) - feature - release, branches
 hotfix -->to master and release branches


To create a new branch and switch to new one
```
git checkout -b "BranchName"
```

To check the current(working) branch, Star is mentioned on the current branch
```
git branch
```

To merge, Go to the branch that should be merged to,
During the merge, conflict occurs, resolve any Merge Conflicts (if any): If there are any merge conflicts, Git will prompt you to resolve them. You can open the conflicting files, resolve the conflicts, and then add and commit the changes. 
```
git merge <BranchName>
git push origin master
```

To delete the branch
```
git branch -d <BranchName>
```

If the branch contains changes that have not been merged to ,
```
git branch -D <BranchName>
```
and 
```
git push origin --delete <BranchName>
```

Configuring username and email
```
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```
