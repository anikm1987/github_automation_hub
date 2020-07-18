echo off
set /P commitMsg="Enter Github commit message: "
set /P prjName="Enter Only Project Name (https://github.com/anikm1987/kube-skaffold.git =>kube-skaffold):"
set /P branchName="Enter Branch Name (Example : kube-skaffold-feature):"
"C:\Program Files\Git\bin\sh.exe" --login -i -c "chmod +x ./*.sh && ./UpdateLocalPushToRemoteBranchAndPullRequestOrigin.sh '%commitMsg%' %prjName% %branchName%" 
pause