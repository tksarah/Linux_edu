# su, sudo 

1. Windows のパソコンで、PowerShell を起動

2. PowerShell でssh を使って、root （スーパーユー）でサーバーにログイン

```bash
> ssh root@<server ip address>

例）
> ssh root@192.168.0.2
```

3. taro ユーザーの作成

```bash
# useradd taro
```

4. taro ユーザーのパスワード設定

```bash
# passwd taro
```

