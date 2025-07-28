#!/usr/bin/env bash
# clone from git@git.opencomputing.cn/yumoqing/kyrag
# git clone https://git.opencomputing.cn/yumoqing/kyrag
cdir=$(pwd)
uname=$(id -un)
gname=$(id -gn)
python3 -m venv py3
source py3/bin/activate
$cdir/py3/bin/pip install -r requirements.txt
mkdir pkgs
cd pkgs
dir=$(pwd)
for m in appbase rbac filemgr rag dapi uapi
do
	echo "install $m module..."
	cd $dir
	git clone https://git.opencomputing.cn/yumoqing/$m
	cd $dir/$m
	$cdir/py3/bin/pip install .
	cd $dir/$m/models
	xls2ddl mysql . > mysql.ddl.sql
	mysql -h db -utest -ptest123 kyrag < mysql.ddl.sql
	cd $dir/$m/json
	./build.sh
	ln -s $dir/$m/wwwroot $cdir/wwwroot/$m
done
ln -s /d/public/bricks $cdir/wwwroot
cd $cdir
cat > $cdir/kyrag.service <<EOF
[Unit]
Wants=systemd-networkd.service

[Service]
User=$uname
Group=$gname
Type=forking
WorkingDirectory=$cdir
ExecStart=$cdir/start.sh
ExecStop=$cdir/stop.sh
StandardOutput=append:/var/log/kyrag/kyrag.log
StandardError=append:/var/log/kyrag/kyrag.log
SyslogIdentifier=kyrag

[Install]
WantedBy=multi-user.target
EOF
cat > $cdir/start.sh <<EOF
#!/usr/bin/bash
cd $cdir
$cdir/py3/bin/python $cdir/app/kyrag.py -p 9182 -w $cdir &
exit 0
EOF
cat > $cdir/stop.sh <<EOF
PORT=9182
PID=\$(lsof -t -i:$PORT)

if [ -n "\$PID" ]; then
    echo "找到端口 $PORT 的进程: PID=\$PID"
    kill -9 \$PID
    echo "已终止端口 $PORT 的进程"
else
    echo "未找到端口 $PORT 的进程"
fi
EOF
chmod +x $cdir/start.sh stop.sh
sudo mkdir /var/log/kyrag
sudo cp kyrag.service /etc/systemd/system
sudo systemctl enable kyrag
sudo systemctl restart kyrag
