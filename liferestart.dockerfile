安装git并从github拉去代码
yum -y install git
ssh-keygen -t ed25519 -C "2507697169@qq.com"
ls -al ~/.ssh
cat /root/.ssh/id_ed25519.pub
git clone git@github.com:VickScarlet/lifeRestart.git

安装nodejs
cd /usr/local/
wget https://nodejs.org/dist/v14.17.6/node-v14.17.6-linux-x64.tar.xz
tar xvf node-v14.17.6-linux-x64.tar.xz
vim /etc/profile
在配置文件的最后加上
    #set for nodejs
    export NODE_HOME=/usr/local/node-v14.17.6-linux-x64
    export PATH=$NODE_HOME/bin:$PATH
source /etc/profile
node -v
npm -v

安装人生重开模拟器
cd /opt/games/lifeRestart
npm install
npm run dev
打开网页看是否正常显示
    http://localhost:8080/view/index.html

安装gcc
yum install gcc-c++

下载pcre
wget https://jaist.dl.sourceforge.net/project/pcre/pcre/8.45/pcre-8.45.tar.gz
tar zxvf pcre-8.45.tar.gz 
cd pcre-8.45/
./configure 
make && make install
pcre-config --version

安装zlip
wget http://zlib.net/zlib-1.2.11.tar.gz
tar zxvf zlib-1.2.11.tar.gz
cd zlib-1.2.11/
./configure
make && make install

安装nginx
wget https://nginx.org/download/nginx-1.18.0.tar.gz
tar zxvf nginx-1.18.0.tar.gz
cd nginx-1.18.0/
./configure
make && make install
whereis nginx
/usr/local/nginx/sbin/nginx
ps -aux|grep nginx
localhost

配置nginx
cp /usr/local/nginx/conf/nginx.conf
vim /usr/local/nginx/conf/nginx.conf

listen       80;
    server_name	localhost;
	#location / {
		#root html;
		#index index.html;
	#}
	#server_name	liferestart.robotinx.com;
        #charset koi8-r;

        #access_log  logs/host.access.log  main;

	set $relife_root "/opt/games/lifeRestart";
	root $relife_root/view;
	location / {
		index index.html ;
	}
	location /data {
		alias $relife_root/data; 
	}
	location /lib {
		alias $relife_root/lib;
	}
	location /public {
		alias $relife_root/public; 
	}

/usr/local/nginx/sbin/nginx -s reload


/opt/games/lifeRestart