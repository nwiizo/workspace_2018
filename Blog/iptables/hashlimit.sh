#!/bin/bash

iptables -P INPUT DROP

# hashlimitについて
# --hashlimit-name
#   ハッシュテーブルの名前を指定します
#   hogeという名前にした場合は/proc/net/ipt_hashlimit/hogeで参照可能です
# --hashlimit
#   hashlimit-burstで指定した値を超えた場合の制限ルールを設定します
#   1/mなら1分間に1回のみ許可
# --hashlimit-burst
#   hashlimit適用までに受け付ける接続回数ですこの値を超えた場合に
#   hashlimitの制限をうけることになります
# --hashlimit-mode
#   特定ホストの識別方法を指定します。srcipで送信元IPアドレス。
#   srcip,dstportと指定すればポートが異なれば別ホストとしてカウントします
# --hashlimit-htable-expire
#   ハッシュテーブルの有効期限です。最後の接続したパケットから指定した時間（ミリ秒）
#   経てばレコードを削除します

#sshは5回まで新規接続許可それ以降は1分に1回に制限、6分間無接続なら制限解除
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m hashlimit \
  --hashlimit-name ssh_limit --hashlimit 1/m --hashlimit-burst 5 \
  --hashlimit-mode srcip --hashlimit-htable-expire 360000 -j ACCEPT
#webは700回まで新規接続許可それ以降は1秒に1回に制限、6分無接続なら制限解除
iptables -A INPUT -p tcp -m multiport --dport 80,443 -m state --state NEW -m hashlimit \
  --hashlimit-name web_limit --hashlimit 60/m --hashlimit-burst 700 \
  --hashlimit-mode srcip --hashlimit-htable-expire 360000 -j ACCEPT
