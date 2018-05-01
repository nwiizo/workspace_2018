#!/bin/bash
iptables -P INPUT DROP
iptables -N ACCEPT_IP
#webは日本国内からのアクセスに限定
iptables -A INPUT -p tcp -m multiport --dport 80,443 -j ACCEPT_IP
#WebサーバへのDoS攻撃対処
iptables -A INPUT -p tcp -m multiport --dport 80,443 -m state --state NEW -m hashlimit \
        --hashlimit-name web_limit --hashlimit 60/m --hashlimit-burst 700 \
            --hashlimit-mode srcip --hashlimit-htable-expire 360000 -j ACCEPT

#SMTPS,IMAPSは日本国内からのアクセスに限定
iptables -A INPUT -p tcp -m multiport --dport 465,993 -j ACCEPT_IP

#25番はどこからでもアクセスさせる
iptables -A INPUT -p tcp --dport 25 -j ACCEPT

# 補足）
# この例では送信は587ではなくより安全な465(SMTPS)を使います
# 25番を開放しないと受信ができないため開放します
# (メールサーバ間は25番でやりとりされるため)
# 第三者中継かどうかはあて先が自ドメインかそうでないかの判定が
# 必要になるためIPベースでは行えません
# MTA側で設定すべきです
