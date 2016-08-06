Root repository for ICD model files
===================================

This is the root repository for TMT interface control document (ICD) model files. 
It contains a Git submodule for each TMT subsystem.

*For an overview of the TMT ICD workflow [see here](Workflow.md).*

ICD model files describe the APIs for TMT subsystems in a format defined by the [icd](https://github.com/tmtsoftware/icd)
software (based on [HOCON](https://github.com/typesafehub/config/blob/master/HOCON.md), a simplified form of JSON).
The model files are validated by the software using [JSON Schema](http://json-schema.org/).

You can use the `icd-ingest.sh` script in the [icd](https://github.com/tmtsoftware/icd) project to import the contents of
this repository, with version history, into the ICD database.

Warning: The icd-ingest.sh script will delete the current contents of the ICD database before
ingesting the files from the repository.

The icd software looks for release tags in the Git submodules.
Git subsystem releases should have names like "v1.0", "v1.2", "v2.0", etc.
These then translate into published versions in the ICD database: "1.0", "1.1", "2.0".

How to use Git with this repository
-----------------------------------

See [here](Git.md) for a detailed description of the Git commands used to manage the ICD repositories.
If you are working on subsystem ICD model files, the following commands can be used:

In order to check out the top level repository with the submodules you need to add the --recursive flag, like this:

```
  git clone --recursive https://github.com/tmtsoftware/ICD-Model-Files.git
```

To update the repository later to get the latest changes:
```
  git pull
  git submodule foreach git pull origin master
```

The second line iterates through all the git submodules and runs "git pull origin master" on each.

Note that it is not necessary to check out the top level repository. If you are only interested in a few
different subsystems, you can check out the repositories for those and work with them in the usual way,
pushing any changes when ready:

```
  git clone https://github.com/tmtsoftware/TCS-Model-Files.git
  git clone https://github.com/tmtsoftware/WFOS-Model-Files.git
  ...
```

