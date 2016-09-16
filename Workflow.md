# Overview
This page describes the process for the development and publishing of 
Software ICDs, specifically using model files and GitHub.

# References
1. [ICD Database User Manual](https://docushare.tmt.org/docushare/dsweb/Get/Document-50189/OSW%20TN018-ICDDatabaseUserManual_REL01.pdf)  
2. [TMT Configuration Control Plan](https://docushare.tmt.org/docushare/dsweb/View/Document-601/TMTConfigControlPlan.docx)
3. [TMT ICD Template](https://docushare.tmt.org/docushare/dsweb/Get/Document-1858/ICD%20Template_REL07%20FINAL.docx)

# Workflow for ICD Framework Documents:
The ICD Framework Document is the first step in the development of
software ICDs. The two ICD subsystem teams participating in the
interface work together to develop the ICD Framework document. The
Framework Document is a Word document following the TMT ICD Template
[Ref 3]. This document describes the basic high level agreements on the
interface. Framework documents guide the detailed APIs and ICD documents
that are developed using Model Files and the ICD Database. ICD Framework
Documents are stored on Docushare and the release process follows the
TMT Configuration Control Plan (Ref 2). They are published to Docushare
following the standard systems engineering process for releasing ICD
documents (See Configuration Control Plan [Ref 2]). The combination of
the Framework document and the ICD published from the ICD Database forms
the software ICD between two subsystems.

# Workflow for detailed APIs and ICDs using the ICD Database 
This step assumes that the framework document is already published.

# Overview of GitHub organization:
The GitHub model file repository (See
https://github.com/tmtsoftware/ICD-Model-Files) is structured to have a
Submodule for each SubSystem (IRIS-Model-Files, TCS-Model-Files, etc) as
well as a Root Repository that references specific commits to these
submodules.  Individual teams can push changes to their Submodules
without external review or approval. The approval / release process
involves the step of updating the commit to the Root Repository. This is
done at the time of a formal release of an API.  ICDs are generated from
the API commits that are in the Root Repository.  All ICDs related to an
updated API are re-published when that API is approved into the Root
Repository.  Several APIs will often be considered together for approval
/ release of new ICDs.

The GitHub model file repository (See https://github.com/tmt-icd) is structured to have a Submodule for each SubSystem (IRIS-Model-Files, TCS-Model-Files, etc).  Teams can update their model files by pushing to these repositories at any time.  Once they are ready to publish and ICD, a request is made to TMT systems engineering (SE). SE then reviews the proposed changes and decides on publishing the APIs and related ICD(s). Publishing happens through the ICD Database software, and results in updates to https://github.com/tmt-icd/ICD-Model-Files/tree/master/apis and https://github.com/tmt-icd/ICD-Model-Files/tree/master/icds, which are read by the ICD Database sofware to provide publishing history information for all users.  Several APIs will often be considered together for approval / release of new ICDs.  All affected ICDs related to an updated API are re-published when a new version is approved.  

# Workflow Steps:
1. Teams work with each other to agree on ICDs, updating their API’s as
needed to reach agreement. During this process, each team updates their
API’s by pushing to their GitHub submodule, for example
“IRIS-Model-Files”.  No approval is required for this step.
2. When ready, the teams request Systems Engineering to release new
version(s) of API(s) and ICD(s).
3. SE Reviews the request, consults with stakeholders and
agrees/disagrees to publishing the ICD.
4. Once approved, TMT Systems Engineering will update the Root
Repository to include the changes made in each submodule repository. 
One this is complete the updated APIs and ICDs can be loaded into the
ICD Database using the icd-ingest.sh script.
5. TMT Systems Engineering publishes the ICD(s) related to updated Root
Repository APIs in .pdf format on Docushare.  This and the accompanying
Framework document form the full ICD.

# To Do 
## To Do (Kim):
1. Set up permissions so that each team can push to their own repository
2. Set up permissions so that Scott can merge the pull request.
3. Set up repositories as a different project

## To Do (Allan):
1. Implement publishing ICDs using files in the repository in HOCON/JSON format
that record the history, comments of ICD releases (short term)

2. Replace ingest-icd.sh script with more advanced application or web app.  
Need ability to update from Root (all or selected modules?) or selected latest from a
submodule that may not yet have been committed to the Root. (longer term)

## To Do (Kim and Scott):
Run through a complete process to publish an ICD with tools (following completion of Item 1 from Allan)
