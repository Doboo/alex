apt-get update
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get install xorg lxde-core tightvncserver -y
#其中xorg为x window，tightvncserver为vnc server
tightvncserver :1
#启动vnc
#暂停VPNC
tightvncserver -kill :1

echo "lxterminal &" >> ~/.vnc/xstartup
echo "/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
#把地址保存到一个文件
 echo "https://www.alexamaster.net/autosurf.php?Master=20648" >> ~/alexurl

nano ~/.vnc/xstartup
tightvncserver :1
#安装firefox
wget ftp://ftp.mozilla.org/pub/firefox/releases/32.0/linux-i686/en-US/firefox-32.0.tar.bz2
tar xjf firefox-32.0.tar.bz2
mv firefox/ /usr/local/lib/
ln -s /usr/local/lib/firefox/firefox /usr/bin/firefox
#这也是一种安装方式
apt-get install iceweasel -y
#安装flash
wget http://vagex-debian.googlecode.com/files/libflashplayer.so
mkdir -p /usr/local/lib/firefox/plugins
mv libflashplayer.so /usr/local/lib/firefox/plugins/
#支持中文语言
apt-get install ttf-arphic-ukai ttf-arphic-uming ttf-arphic-gbsn00lp ttf-arphic-bkai00mp ttf-arphic-bsmi00lp


#创建重启脚本
cat <<- EOF >> /root/alex/myrestart.sh
#!/bin/sh
export DISPLAY=localhost:1.0
rm -rf ~/.vnc/*.log /tmp/plugtmp* > /dev/null 2>&1
killall firefox  > /dev/null 2>&1
/usr/bin/firefox > /dev/null 2>&1 &
EOF
#给予启动权限
chmod a+x /root/myrestart.sh
#设置定时器
echo "0 * * * * root /root/alex/myrestart.sh" >>/etc/crontab
crontab -l
#重启定时器
/etc/init.d/cron restart