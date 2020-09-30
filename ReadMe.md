# Automating your github workflow

#### Prerquisites 
	- Git needs to be installed locally
	- hub needs to be installed locally
	- Open all .bat file and replace the location "C:\Program Files\Git\bin\sh.exe" with your machine sh location
	- you should have a github account with authentication token created.
	

## FOR WINDOWS
	
##### creating a new project
	- Double click on CreateProject.bat and provide all the details it asks for. While asked for github password provide the authentication token. This requires only one time.
	
##### Update feature from origin
	- Double click on UpdateFeatureBranchFromOrigin.bat file and provide all the required information.
	- This script will create the feature branch if it is already does not exist
	
##### update some changes in the feature branch in your local system

##### Update local feature branch and push it to remote branch 
	- Docuble click on UpdateLocalPushToRemoteBranch.bat file and provide all the required information.
	- It will commit your changes in local then push it to remote branch.
	
##### Update local feature branch , push it to remote branch and then create pull request to merge it to origin
	- Docuble click on UpdateLocalPushToRemoteBranchAndPullRequest.bat file and provide all the required information.


## FOR Linux

- Execute command chmod +x *.sh

##### creating a new project
	- Execute command -> ./CreateGithubProject.sh <prjName>
	
##### Update feature from origin
	- - Execute command -> ./UpdateFeatureBranchFromOrigin.sh <gitprjName> <prjName> <branchName>
	- This script will create the feature branch if it is already does not exist
	
##### update some changes in the feature branch in your local system

##### Update local feature branch and push it to remote branch 
	- - Execute command -> ./UpdateLocalPushToRemoteBranch.sh '<commitMsg>' <prjName> <branchName>
	- It will commit your changes in local then push it to remote branch.
	
##### Update local feature branch , push it to remote branch and then create pull request to merge it to origin
	- Execute command -> ./UpdateLocalPushToRemoteBranchAndPullRequestOrigin.sh '<commitMsg>' <prjName> <branchName> 


