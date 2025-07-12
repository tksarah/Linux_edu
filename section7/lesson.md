# 演習 su, sudo 

## 1. Windows のパソコンで、PowerShell を起動

## 2. PowerShell でssh を使って、root （スーパーユー）でサーバーにログイン

```bash
PS C:\Users\XXX> ssh root@<server ip address>

例）
PS C:\Users\XXX> ssh root@192.168.0.2
```

## 3. taro ユーザーの作成

```bash
# useradd taro
```

## 4. taro ユーザーのパスワード設定

```bash
# passwd taro
```

## 5. su コマンドで taro ユーザーに切り替える

```bash
# su - taro
$ 
```

## 6. taro ユーザーになっている事を id コマンドで確認

## 7. 以下のコマンドを sudo を使って実行し、エラーで実行できないことを確認

```bash
$ sudo dnf install tree
We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for taro: （ここで taro パスワードを入力）
```

* dnf コマンドの意味は、dnf というコマンドを使ってインターネットから"tree"というパッケージをインストールしている
* sudo はじめて実行する場合は上記の警告メッセージが１度だけ出力される

## 8. 一度、taro ユーザーから root に戻る
**exit** コマンドを使うと、taro ユーザーに切り替わる前のユーザーに戻る

## 9. root ユーザーに戻っている事を id コマンドで確認

## 10. taro ユーザーで sudo を使えるようにする

```bash
# usermod -G wheel -a taro
```

## 11. taro ユーザーに wheel グループが追加されているかを id コマンドで確認

## 12. 再度 su コマンドで taro ユーザーに切り替える

```bash
# su - taro
```

## 13. taro ユーザーになっている事を id コマンドで確認

## 14. 再度以下のコマンドを sudo を使って実行してみる

```bash
$ sudo dnf install tree
```

"y" を入力して、tree パッケージをインストール


以上、
