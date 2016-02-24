#!/usr/bin/perl

use IO::Socket;
use strict;

my($sock, $word, $port, $ipaddr, $hishost, $MAXLEN, $PORTNO, $TIMEOUT);

$MAXLEN  = 2048;
$PORTNO  = 6062;
$TIMEOUT = 1;

$sock = IO::Socket::INET->new(Proto     => 'udp',
                              PeerPort  => $PORTNO,
                              PeerAddr  => 'localhost') or die "Creating socket: $!\n";

#open FILE, "<osszesfonev.txt" or die $!;
#open FILE, "<adj/allmn2.txt" or die $!;
#open FILE, "<verb/igek2.txt" or die $!;
open FILE, "<$ARGV[0]" or die $!;
#"</home/en/program/foma/tktest/tools/gyujtes/itek1nincsjo" or die $!;
my  $word2;
while (<FILE>) { 
  chomp;
  $_ =~ s/^\s+//; #remove leading spaces
  $_ =~ s/\s+$//; #remove trailing spaces
  my $word1 = $_;

  $sock->send("$_") or die "send: $!";

  eval {
    local $SIG{ALRM} = sub { die "time out" };
#    local $SIG{ALRM} = sub { die "time out" };
    alarm $TIMEOUT;
    $sock->recv($word2, $MAXLEN)      or die "recv: $!";
    alarm 0;
  } or die "localhost timed out after $TIMEOUT seconds.\n";

print "$word1: $word2";
}