apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get install xorg lxde-core tightvncserver iceweasel  -y
#其中xorg为x window，tightvncserver为vnc server
tightvncserver :1

#暂停VPNC
tightvncserver -kill :1

echo "lxterminal &" >> ~/.vnc/xstartup
echo "/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
  

#nano ~/.vnc/xstartup

#安装firefox
#wget ftp://ftp.mozilla.org/pub/firefox/releases/32.0/linux-i686/en-US/firefox-32.0.tar.bz2
#tar xjf firefox-32.0.tar.bz2
#mv firefox/ /usr/local/lib/
#ln -s /usr/local/lib/firefox/firefox /usr/bin/firefox


#安装flash
wget http://vagex-debian.googlecode.com/files/libflashplayer.so
mkdir -p /usr/local/lib/firefox/plugins
mv libflashplayer.so /usr/local/lib/firefox/plugins/
#支持中文语言
apt-get install ttf-arphic-ukai ttf-arphic-uming ttf-arphic-gbsn00lp ttf-arphic-bkai00mp ttf-arphic-bsmi00lp -y




#给予启动权限
chmod a+x /root/alex/myrestart.sh
#设置定时器
echo "00 * * * * root /root/alex/myrestart.sh" >>/etc/crontab
nano /etc/crontab 
#重启定时器
/etc/init.d/cron restart
#启动vnc
tightvncserver :1