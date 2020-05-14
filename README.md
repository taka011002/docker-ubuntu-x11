
# docker-ubuntu-x11
docker for mac上でubuntuコンテナを立てて、x11を使用したバイナリファイルを実行する事を目的としています。  
バイナリファイルは含めていない為、各自実行したいものを用意してください。

# 環境
macOS Catalina: 10.15.4  
Docker: 19.03.8
docker-compose 1.25.5

mac以外ののOSでも動くと思いますが、ホスト側のxquartz周りの設定を変えてあげる必要があると思います。 

# 使い方
## xquartzの導入
X11を用いたプログラムを実行するため，ホスト(mac)側でGUIを使用するために、xquartzを導入する。

brewを導入済みの場合は下記コマンドでxquartzを導入する
```
brew cask install xquartz
```
導入後は再起動かユーザーのログアウトを行わないとxquartzの反映が行われないので注意


brewを使用していない場合はimgを公式から

XQuartz.appを起動できる様になったら、起動し環境設定からネットワーク・クライアントからの接続を許可にチェックを入れ、XQuartzを再起動。

# 起動
docker(docker-compose)で構築することもできます。  
以下makeを使っています。コマンドの内容はMakefileを見てください

srcディレクトリをDockerコンテナ側にマウントするようにdocker-composeを記述しています。

## イメージを作成
実行したいバイナリファイルをcommandディレクトリに配置るるとDockerイメージに書き込む様に記述しています。

```
make build
```

## 起動
```
make up
```

## 終了
```
make down
```

## 再起度
```
make restart
```

## コンソール
```
make bash
```

## XQuartzの疎通確認
```
make xeyes
```
目のアイコンが起動しない場合は、.envファイルの設定を自分のホストマシンのIPアドレスに変更してみてくだい。

## binaryファイルが使用できる事の確認
適時実行したいbinaryファイルに置き換えてください
```
make binary
```

