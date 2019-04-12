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
The GitHub site [tmt-icd](https://github.com/tmt-icd) contains a git repository for each subsystem (IRIS-Model-Files, TCS-Model-Files, etc).  
Teams can update their model files by pushing to these repositories at any time.  
Once they are ready to publish and ICD, a request is made to TMT systems engineering (SE). 
SE then reviews the proposed changes and decides on publishing the APIs and related ICD(s). 
Publishing happens through the [ICD Database software](https://github.com/tmtsoftware/icd), 
and results in updates to files in the [./apis](apis) or [./icds](icds) directories in this repository. 
These files are read by the ICD Database sofware to provide publishing history information for all users.  
Several APIs will often be considered together for approval / release of new ICDs.  
All affected ICDs related to an updated API are re-published when a new version is approved.  

# Workflow Steps:
1. Teams work with each other to agree on ICDs, updating their API’s as
needed to reach agreement. During this process, each team updates their
API’s by pushing to their GitHub repository, for example
“IRIS-Model-Files”.  No approval is required for this step.
2. When ready, the teams request Systems Engineering to release new
version(s) of API(s) and ICD(s).
3. SE Reviews the request, consults with stakeholders and
agrees/disagrees to publishing the ICD.
4. Once approved, TMT Systems Engineering will publish the APIs and related ICDs, which results in updates to the apis and icds version history.  This information is then available to all users of hte ICD Database.
5. TMT Systems Engineering publishes the ICD(s) .pdf format on Docushare.  This and the accompanying
Framework document form the full ICD.

# Configuration Control of Framework and Detailed ICD Documents
For ease of publishing we will establish the Framework documents as a separate releases from the ICD Database published document.  Framework document can reference the detailed ICD (from the ICD Database) as a reference document (i.e. no version reference is needed). The framework document will follow the standard TMT document release process with routing for signatures. The detailed ICD will be released from the ICD Database following the release process described above (SE reviewing, checking with stakeholders, then publishing from ICD Database and placing PDF on Docushare).  

By following this process it's possible to re-release the detailed ICD without needing to update the Framework document. This is acceptable as long as the detailed ICD doesn’t violate the content of the Framework document. There may be occasions the Framework document needs to change when a detailed ICD is released because some aspect of the higher level description of how the interface works has been changed, but usually it will just be a re-release of the detailed ICD.

Configuration Index Documents (CID) for subsystems should reference both the Framework and Detailed ICD documents as participating parts of software ICDs.
