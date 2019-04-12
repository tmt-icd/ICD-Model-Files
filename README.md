# Repository holding Version Information for ICD model files

The GitHub site [tmt-icd](https://github.com/tmt-icd) contains a number of repositories holding TMT interface control document (ICD) model files. 
It contains a Git repository for each TMT subsystem.

*For an overview of the TMT ICD workflow [see here](Workflow.md).*

ICD model files describe the APIs for TMT subsystems in a format defined by the [icd](https://github.com/tmtsoftware/icd)
software (based on [HOCON](https://github.com/typesafehub/config/blob/master/HOCON.md), a simplified form of JSON).
The model files are validated by the software using [JSON Schema](http://json-schema.org/).

You can use the [icd-git](https://github.com/tmtsoftware/icd/icd-git) command to import the APIs and ICDs for a selected subsystem (or all subsystems),
with version history, into the ICD database.

Warning: The `icd-git` command will delete the current contents of the local ICD database before
ingesting the files from the repository.


Publishing a subsystem API or ICD with `icd-git` creates an entry in a JSON file under the [./apis](apis) or [./icds](icds) directory. 
These files should not be manually edited. They are used to store version related information.

An ICD version is defined by an entry in a JSON formatted file named *icd-$subsytem1-$subsystem2.json* which is stored in the icds subdirectory of this repository.
The file lists the two subsystems that make up the ICD, the ICD version, the versions of the two subsystems along with the user name of the user that created the version, a comment and the date.

See the [icd](https://github.com/tmtsoftware/icd) project and [icd-git](https://github.com/tmtsoftware/icd/icd-git) subproject for more information.

