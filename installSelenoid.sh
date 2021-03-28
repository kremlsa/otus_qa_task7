#Install docker and run selenoid
#Получаем списки обновлений для пакетов
sudo apt-get update
#
#Если докера нет, то устанавливаем
if [ $(dpkg-query -W -f='${Status}' docker.io | grep -c "ok installed") -eq 0 ];
then
sudo apt -y install docker.io
fi
#
#Если curl нет, то устанавливаем
if [ $(dpkg-query -W -f='${Status}' curl | grep -c "ok installed") -eq 0 ];
then
sudo apt install curl
fi
#
#Устанавливаем селеноид через менеджер и запускаем
sudo curl -s https://aerokube.com/cm/bash | bash \
&& ./cm selenoid start --vnc  --browsers "chrome:89.0;firefox:87.0" --args "-session-attempt-timeout 5m -service-startup-timeout 5m" -l 10
#Запускаем графическую оболочку
sudo ./cm selenoid-ui start
