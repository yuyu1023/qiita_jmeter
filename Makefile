# 構築対象のIPセット
HOSTNAME1 = ec2-xxx-xxx-xxx-xxx

# 鍵設定
KEY = hoge.pem

# 初期構築
all/setup: init jmx-up

# jmeterをインストールするシェルコピー&実行
init:
	scp -i ./${KEY} ./init.sh centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com:/home/centos/
	ssh -i "${KEY}" centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com 'chmod 755 /home/centos/init.sh ; /home/centos/init.sh'

# シナリオup&権限変更
jmx-up:
	scp -i ./${KEY} ./tests/hoge_live.jmx centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com:/home/centos/
	ssh -i "${KEY}" centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com 'chmod 755 /home/centos/hoge_live.jmx' 
	clear
	echo "make jmx-exe time=`date +%Y%m%d-%H%M%S`"

# シナリオ実行 make jmx-exe time=`date +%Y%m%d-%H%M%S`
jmx-exe:
	ssh -i "${KEY}" centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com  'apache-jmeter-5.1.1/bin/jmeter -n -t hoge_live.jmx -l ./log/${time}_${HOSTNAME1}_log.jtl' &  

# log取得
jmx-get:
	scp -i ./${KEY} centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com:/home/centos/log/*.jtl ./log/

# 綺麗にする
clear:
	ssh -i "${KEY}" centos@${HOSTNAME1}.ap-northeast-1.compute.amazonaws.com  'rm -rf apache-jmeter-5.1.1 apache-jmeter-5.1.1.zip init.sh hoge_live.jmx jmeter.log log/' &  
