# ベースイメージの取得
FROM registry.access.redhat.com/ubi8:latest

# node.jsの利用に必要なパッケージ（ランタイム）をインストール
# RUNの後にlinuxコマンドをそのまま記載します
RUN dnf module install nodejs -y
RUN npm install express
RUN npm install ejs

# コンテナ起動した後に遷移させる作業ディレクトリの設定
WORKDIR /usr/src/app

# ホストで作成済みのnode.jsアプリケーションの動作に必要なソースコード（一部）をコンテナ内の作業ディレクトリに転送
# package.jsonは、`npm init`すると作成されるものです。なお`node "アプリ名"`ではなく、`npm start`でアプリ起動できる設定をしています。
COPY . .

# コンテナを立ち上げた後に発動して欲しいコマンドを記載。
# コマンド毎に区切って記載しないといけない。要は`npm start`というコマンドを打ちたい。
CMD ["npm", "start"]
