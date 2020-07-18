echo off
set /P gitprjName="Enter Github Project Name (https://github.com/anikm1987/kube-skaffold => anikm1987/kube-skaffold): "
set /P prjName="Enter Only Project Name (https://github.com/anikm1987/kube-skaffold =>kube-skaffold):"
set /P branchName="Enter Branch Name (Example : kube-skaffold-feature):"
"C:\Program Files\Git\bin\sh.exe" --login -i -c "chmod +x ./*.sh && ./UpdateFeatureBranchFromOrigin.sh %gitprjName% %prjName% %branchName%" 
pause