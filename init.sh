#/bin/sh
	sudo su -c "yum -y install java-1.8.0-openjdk.x86_64 && yum -y install unzip" -
	curl -O http://ftp.jaist.ac.jp/pub/apache/jmeter/binaries/apache-jmeter-5.1.1.zip && unzip apache-jmeter-5.1.1.zip
	chmod 755 apache-jmeter-5.1.1/bin/jmeter
	apache-jmeter-5.1.1/bin/jmeter -v