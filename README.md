Root repository for ICD model files
===================================

This is the root repository for TMT ICD model files. It contains a Git submodule for each TMT subsystem.

ICD model files describe the APIs for TMT subsystems in a format defined by the [icd](https://github.com/tmtsoftware/icd)
software (based on [HOCON](https://github.com/typesafehub/config/blob/master/HOCON.md), a simplified form of JSON).
The model files are validated by the software using [JSON Schema](http://json-schema.org/).

How to use Git with this repository
-----------------------------------

To add a subsystem to this repository, first create the repository on GitHub
(under [tmtsoftware](https://github.com/tmtsoftware)), then (For example, for TCS):

```
   git submodule add https://github.com/tmtsoftware/TCS-Model-Files.git
   git commit -m "added TCS subsystem model files repository"
   git push
```

In order to check out this repository with the submodules you need to add the --recursive flag, like this:

```
  git clone --recursive https://github.com/tmtsoftware/ICD-Model-Files.git
```

To update the repository later to get the latest changes:
```
  git pull
  git submodule foreach git pull origin master
```

The second line iterates through all the git submodules and runs "git pull origin master" on each.

Any changes should be made by *forking* the individual subsystem repositories (such as TCS-Model-Files)
and then making a *pull request*.
The TMT system administrator will then merge the changes into this repository.

Once the pull request has been accepted and merged, the TMT system administrator should run commands like this to update
this repository to include the changes made in the submodule repository:

```
   cd TCS-Model-Files
   git pull origin master
   cd ..
   git commit -m "comment..." TCS-Model-Files
   git push
```
