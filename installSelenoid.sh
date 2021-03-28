#Install docker and run selenoid
#Refresh 
sudo apt-get update
#
#Install docker if not installed
if [ $(dpkg-query -W -f='${Status}' docker.io | grep -c "ok installed") -eq 0];
then
    sudo apt -y install docker.io;
fi
#
#Install curl if not installed
if [ $(dpkg-query -W -f='${Status}' curl | grep -c "ok installed") -eq 0];
then
    sudo apt install curl;
fi
#
#Install selenoid container from cm
sudo curl -s https://aerokube.com/cm/bash | bash \
&& ./cm selenoid start --vnc  --browsers "chrome" -l 10 --args 'session-attempt-timeout 5m -service-sta>
sudo ./cm selenoid-ui start
