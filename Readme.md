# EC2＋jmeter　負荷検証セット

## command
> make all/setup 初期セットアップ
> make init　jmeter関連のセットアップ(初期セットアップにて自動実行される)
> make jmx-up　テストシナリオをEC2にコピーする(初期セットアップにて自動実行される)
> make jmx-exe EC2にコピーしたシナリオを実行する
> make jmx-get　シナリオの実行結果を/log配下にコピーする