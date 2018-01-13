### Install
```
sudo apt-get install sqlite3 libsqlite3-dev
sudo pip install -r requirements.txt
```

### Start
```
python3 app.py
```

### Enable
#### Install
##### CentOS
```
yum install supervisor 
```
##### Ubuntu
```
apt install supervisor
```
#### Setting
##### systemd 
```
systemctl start supervisord
systemctl status supervisord
systemctl stop supervisord
```
##### Config
/etc/supervisord.d/owasp0120.conf
```
[program:owasp0120]
command=python3 ./app.py runserver  ; direcotryからの相対パスでOK。
user=****
directory=/****/
autorestart=true
stdout_logfile=/var/log/supervisor/owasp.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=5
stdout_capture_maxbytes=1MB
redirect_stderr=true
```
