How to use Git with this repository
-----------------------------------

In order to check out this repository with the submodules you need to add the --recursive flag, like this:

```
  git clone --recursive https://github.com/tmtsoftware/ICD-Model-Files.git
```

To add a new subsystem to this repository, first create the repository on GitHub
(under [tmtsoftware](https://github.com/tmtsoftware)), then (For example, for TCS):

```
   git submodule add https://github.com/tmtsoftware/TCS-Model-Files.git
   git commit -m "added TCS subsystem model files repository"
   git push
```

The above command is only for reference and should not normally be needed, since submodules for
all the TMT subsystems have already been added.

To update the repository later to get the latest changes:
```
  git pull
  git submodule foreach git pull origin master
```

The second line iterates through all the git submodules and runs "git pull origin master" on each.

Once changes in a TMT subsystem/submodule repository have been checked in, the TMT system administrator can run commands 
like this to update the top level repository to include the changes:

```
   cd TCS-Model-Files
   git pull origin master
   cd ..
   git commit -m "comment..." TCS-Model-Files
   git push
```

This resets the Git submodule for the TCS model files to point to the latest commit.
