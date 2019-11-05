# EC2＋jmeter　負荷検証セット

## command
初期セットアップ
> make all/setup   

jmeter関連のセットアップ(初期セットアップにて自動実行される)  
> make init　

テストシナリオをEC2にコピーする(初期セットアップにて自動実行される)  
> make jmx-up　  

EC2にコピーしたシナリオを実行する
> make jmx-exe   

シナリオの実行結果を/log配下にコピーする
> make jmx-get　  
