#!/bin/bash
iptables -P INPUT DROP

# limitについて
# --limit
#   limit-burstを超えた場合の制限を指定します
# --limit-burst
#   limitによる制限がかかるまでの回数です

#webは1000回までは許可、以降は1分間に120回までに制限する
iptables -A INPUT -p tcp -m state --state NEW --dport 80 -m limit --limit 120/m --limit-burst 1000 -j ACCEPT
