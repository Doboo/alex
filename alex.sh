apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get install xorg lxde-core tightvncserver iceweasel  -y
#����xorgΪx window��tightvncserverΪvnc server
tightvncserver :1

#��ͣVPNC
tightvncserver -kill :1

echo "lxterminal &" >> ~/.vnc/xstartup
echo "/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
  

#nano ~/.vnc/xstartup

#��װfirefox
#wget ftp://ftp.mozilla.org/pub/firefox/releases/32.0/linux-i686/en-US/firefox-32.0.tar.bz2
#tar xjf firefox-32.0.tar.bz2
#mv firefox/ /usr/local/lib/
#ln -s /usr/local/lib/firefox/firefox /usr/bin/firefox


#��װflash
wget http://vagex-debian.googlecode.com/files/libflashplayer.so
mkdir -p /usr/local/lib/firefox/plugins
mv libflashplayer.so /usr/local/lib/firefox/plugins/
#֧����������
apt-get install ttf-arphic-ukai ttf-arphic-uming ttf-arphic-gbsn00lp ttf-arphic-bkai00mp ttf-arphic-bsmi00lp -y




#��������Ȩ��
chmod a+x /root/alex/myrestart.sh
#���ö�ʱ��
echo "00 * * * * root /root/alex/myrestart.sh" >>/etc/crontab
nano /etc/crontab 
#������ʱ��
/etc/init.d/cron restart
#����vnc
tightvncserver :1