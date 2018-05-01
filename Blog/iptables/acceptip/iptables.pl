#!/usr/bin/perl
while (<STDIN>){
    next unless /^apnic\|JP\|ipv4\|(.+)\|(.+)\|\d+\|allocated/;
    print "iptables -A $ARGV[0] -s $1/".(32-log($2)/log(2))." -j RETURN\n";
}
print "iptables -A $ARGV[0] -j DROP\n";
