# Ansible Host の準備

事前に git インストール

```
[root@host ~]# dnf install -y git
```

## Ansible Install
```
[root@host ~]# dnf install -y python3 python3-pip python3-virtualenv
[root@host ~]# python3 -m venv ~/ansible-env
[root@host ~]# source ~/ansible-env/bin/activate
(ansible-env) [root@host ~]# pip install --upgrade pip
(ansible-env) [root@host ~]# pip install ansible
(ansible-env) [root@host ~]# ansible --version
ansible [core 2.15.13]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /root/ansible-env/lib64/python3.9/site-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /root/ansible-env/bin/ansible
  python version = 3.9.23 (main, Aug 19 2025, 00:00:00) [GCC 11.5.0 20240719 (Red Hat 11.5.0-11)] (/root/ansible-env/bin/python3)
  jinja version = 3.1.6
  libyaml = True
```

## sshpass Install
```
[root@host ~]# dnf install -y sshpass
```

## キーペア作成、ノンパス
```
# ssh-keygen -t rsa -b 4096
```

## 受験者のリストを作成
- 受験者用のマシンを作った後に、以下のような students.txt を作成
- 書式： "受講者名  eth1のIPアドレス"

```
<students.txt>
Taro 192.168.0.1
Hanako 192.168.0.2
```

## インベントリファイル（hosts）を作る
-  スクリプト（tools/generate_inventory.sh）を実行
- 作成されたファイル hosts を確認し Playbook と同じディレクトリに置く

## 全受験者マシンに公開鍵をコピー
- Ansible Host の .ssh/known_hosts をリフレッシュ
- スクリプト実行前に、受講者マシンの root のパスワードを"PASSWORD"に設定
- スクリプト（tools/copy_keys.sh）を実行

## 実行テスト

```
(ansible-env) [root@host ~]# ansible target -i hosts -m ping
Hanako | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
Taro | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

## 実行例

受講者と tag 指定
```
ansible-playbook -i hosts playbook.yml -l Taro -t group,user,password,hello,perm,dir,hosts,dns,ip
```
