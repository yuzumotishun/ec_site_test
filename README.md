# Rails共同開発講座

## Member
- 氏名: Tatty
  - 好きなメソッド: map
- 氏名: サッシュン
  - 好きなメソッド: gets




---

## Docker操作
ゼロからdocker環境を立ち上げる場合は、上から順にコマンドを実行すればOK

### docker imageのビルド （約10分）
```
docker-compose build
```
### docker-compose起動
```
docker-compose up
```
※clone後の初回起動時（`docker-compose up`実行後）に「Dockerコンテナが正常に起動しない問題」が発生するので、
`Ctrl + C`でコンテナを停止し、「Dockerコンテナが正常に起動しない問題」の対処法を実行する。

`docker-compose up`で正常に起動すると下記のようなログが出力される。

※`docker-compose up`の実行時はdockerのログが出っぱなしになりコマンド入力できなくなる為、別のターミナルを開いて下さい。
```
web_1  | （省略）
web_1  | * Environment: development
web_1  | * Listening on tcp://0.0.0.0:3000
web_1  | Use Ctrl-C to stop
```

### docker-composeで起動しているコンテナの確認方法
```
docker-compose ps
```
※起動状態：State = Up 、停止状態：State = Exit

### 起動したコンテナにてRails環境構築を行う

**bundle installする**
```
docker-compose exec web bundle install
```
**DBを作成する**
```
docker-compose exec web bundle exec rails db:create
```
**マイグレーション実行**
```
docker-compose exec web bundle exec rails db:migrate
```
※railsページが見れるようになります。http://localhost:3000/

### docker-composeコンテナを停止する方法
```
docker-compose stop
```
### 停止中のdocker-composeコンテナを削除する方法
※対象：カレントディレクトリのdocker-composeコンテナ
```
docker-compose rm
```
### Dockerのイメージ、コンテナ、ネットワーク、ボリューム一括削除
- 未使用なイメージ、コンテナ、ネットワークを一括削除（volumeも含め全て削除）
```
docker system prune -a --volumes
```
### Dockerコンテナ一覧表示
##### カレントのコンテナ一覧
```
docker-compose ps
```
##### 起動中の全てのコンテナ一覧
```
docker ps
```
### Dockerイメージ一覧表示
```
docker images
```
### ログの確認方法
```
docker-compose logs
```

## [clone後 初回] Dockerコンテナが正常に起動しない問題

#### 発生状態
`docker-compose up`を実行後にdockerコンテナが正常に起動せず、logに以下の様に出力されます。
```
========================================
  Your Yarn packages are out of date!
  Please run `yarn install --check-files` to update.
========================================
```

#### 対処法

`Ctrl + C`でコンテナを停止し、以下の方法で yarnをインストールしてください。（約5分）
```
$ docker-compose run --rm web yarn install
```

実行が完了すると下記のようにログが出力されます。
```
[4/4] Building fresh packages...
Done in 366.80s.
```

最後に、コンテナが正常に起動することを確認
```
$ docker-compose up
```
[[この問題についての詳細]](https://qiita.com/yama_ryoji/items/1de1f2e9e206382c4aa5)

