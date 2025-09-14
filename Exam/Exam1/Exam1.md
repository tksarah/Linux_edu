# 試験


| 項目 | 値 |
|------|------|
| 学校名 | XXXXX |
| 試験名 | XXXXX |
| 日付 | XXXXX |
| 受講者名 | XXXXX |

- 以下のすべてのタスクを実施してください
- 正しくできていれば採点されます
- 全体で100点満点です
- それぞれのタスクの点数は難しさに応じて配点されます
- 各人がログインして操作るサーバーはテスト時間前に講師から提供されます

## 注意
- 授業で使ったテキストの参照は可能
- GoogleやYahooなどの検索サイト、AIサイト（ChatGPTやCopilotなど）は禁止
- 問題用紙のヒント以外のサイト閲覧は禁止

## 事前準備
PCを起動し、sshコマンドを使うため、Power Shell を起動します。

## 問題1：　基本操作

配点：50点

ssh で 指定されたサーバーへスーパーユーザー（root）でログインする

1. 「techc」というグループを作成
2. 「taro」というユーザーを作成
3. 「taro」ユーザーを「techc」グループに所属させる
4. 「taro」ユーザーにパスワードを設定、このパスワードは「taro@123」とする

スーパーユーザー（root）から「taro」 ユーザーに切り替える

5. 「taro」ユーザーのホームディレクトリの配下に、「Hello World」と書かれているテキストファイルを「hello」という名前で作成する
6. **5.** で作成したファイルのパーミッションを以下のようにする
      - taroユーザーは読み込み可能、書き込み可能、実行可能
      - グループは、読み込みのみ可能
      - 他のユーザーは、何も許可しない
7. 「taro」ユーザーのホームディレクトリに /etc/hosts を「hosts.taro」という名でコピーする
8. 「taro」のホームディレクトリに”mydir”というディレクトリを作る
9. **8.** で作ったディレクトリの配下に”no1”というディレクトリを作る
10. **9.** で作ったディレクトリの配下に、**7.** で作った hosts.taro ファイルを移動させる

「taro」 ユーザーからスーパーユーザー（root）に切り替える

11. DNSサーバーの情報が書かれているファイルを /root ディレクトリの下にコピーする
12. ログインしているサーバーのIPアドレスの内、eth1 に割り当てられているアドレスを確認し、/root/ipaddress というファイルにIPアドレスを記載し保存する

＜作成されるファイルの例＞ 
```
# cat /root/ipaddress
192.168.100.10
```

## 問題2：　Webサーバー構築　

配点：25点

1. Apache Web Server（httpd）をインストールする
2. Web Server を起動する
3. Web Server はＯＳが再起動したとしても、自動的に起動するように設定する
3. Web Server が起動している状態で、プロセスの状態を確認する ps コマンドを使い、httpd の情報のみを「/root/ps_httpd.out」というファイルに出力せよ

5. Web Server は初期状態ですでにテストページが表示されるようになっている。このテストページの内容を変更して、「Hello World」とだけ表示されるように設定せよ


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ヒント：　https://httpd.apache.org/docs/2.4/ja/getting-started.html#content


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ＜表示例＞  http://自分のマシンのIPアドレス/

 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img width="630" height="361" alt="画像1" src="https://github.com/user-attachments/assets/760427e5-7ca5-4c7a-b139-80681698c101" />

## 問題：　バックアップとスケジューリング

配点：25点

※ 以下の操作はスーパーユーザー（root）で行う。

1. Webサーバーのログファイルには /var/log/httpd/access_log と /var/log/httpd/error_log がある。この2つのファイルを、/var/tmp/examの下にコピーし、tar コマンドで /var/tmp/exam/httpd.logs.tar ファイルにアーカイブをし、さらにgzip で圧縮をして保存する、保存されるファイルは /var/tmp/exam/httpd.logs.tar.gz となる

2. 以下のような script.sh スクリプトファイルを作り、これを毎分（つまり1分毎）に実行されるようにする

```
# cat /root/script.sh　
#!/bin/bash
echo “Hello World” >> /root/run.log
```

設定が終わった後に１分以上待って、/root/run.log に”Hello TEHC”が１分毎に出力され続ける事を確認する。

ヒント：　
- シェルスクリプトを書くためにはエディタ（vi）を使う
- スクリプトを実行するためには実行権限が必要
- シェルスクリプトをスケジューリング実行する場合は cron を使う


以上、
