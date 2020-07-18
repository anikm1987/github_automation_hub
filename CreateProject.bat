echo off
set /P prjName=Enter Project Name: 
"C:\Program Files\Git\bin\sh.exe" --login -i -c "chmod +x ./*.sh && ./CreateGithubProject.sh %prjName%"
pause