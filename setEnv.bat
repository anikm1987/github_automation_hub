echo off
git config --global --unset hub.host    
git config --global --unset hub.protocol
git config --global user.name "Aniket Mukherjee"

git config --global user.email mukherjee.aniket@gmail.com

git config --global --unset http.proxy 
git config --global --unset https.proxy 
echo f | xcopy "%USERPROFILE%/.config/hub.personal" "%USERPROFILE%/.config/hub" /f/y 

pause