apt-get update
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get install xorg lxde-core tightvncserver -y
#����xorgΪx window��tightvncserverΪvnc server
tightvncserver :1
#����vnc
#��ͣVPNC
tightvncserver -kill :1

echo "lxterminal &" >> ~/.vnc/xstartup
echo "/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
#�ѵ�ַ���浽һ���ļ�
 echo "https://www.alexamaster.net/autosurf.php?Master=20648" >> ~/alexurl

nano ~/.vnc/xstartup
tightvncserver :1
#��װfirefox
wget ftp://ftp.mozilla.org/pub/firefox/releases/32.0/linux-i686/en-US/firefox-32.0.tar.bz2
tar xjf firefox-32.0.tar.bz2
mv firefox/ /usr/local/lib/
ln -s /usr/local/lib/firefox/firefox /usr/bin/firefox
#��Ҳ��һ�ְ�װ��ʽ
apt-get install iceweasel -y
#��װflash
wget http://vagex-debian.googlecode.com/files/libflashplayer.so
mkdir -p /usr/local/lib/firefox/plugins
mv libflashplayer.so /usr/local/lib/firefox/plugins/
#֧����������
apt-get install ttf-arphic-ukai ttf-arphic-uming ttf-arphic-gbsn00lp ttf-arphic-bkai00mp ttf-arphic-bsmi00lp


#���������ű�
cat <<- EOF >> /root/alex/myrestart.sh
#!/bin/sh
export DISPLAY=localhost:1.0
rm -rf ~/.vnc/*.log /tmp/plugtmp* > /dev/null 2>&1
killall firefox  > /dev/null 2>&1
/usr/bin/firefox > /dev/null 2>&1 &
EOF
#��������Ȩ��
chmod a+x /root/myrestart.sh
#���ö�ʱ��
echo "0 * * * * root /root/alex/myrestart.sh" >>/etc/crontab
crontab -l
#������ʱ��
/etc/init.d/cron restart