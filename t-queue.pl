#!/usr/bin/perl
# This is a test script that queues an allocation request and triggers
# the seat allocator.

use warnings;
use strict;

# Process mandatory arguments

@ARGV >= 4 or die "Usage: t-queue.pl SERVERIP MAPID TIERID QUANTITY [PRIORITY]";
my ($server, $map, $tier, $qty, $prio) = @ARGV;
$prio ||= 1;
my $serverrpc = 'http://'.$server.':8080/jsonrpc';

# Enqueue the request in SQL tables

use seats::SQL;
my $db = seats::SQL::db_connect();
my $q;
$q = $db->prepare('INSERT INTO `OA-Sales_Bookings`'
		.' SET eventid = 1, crmid = 1, saleid = 1, created = CURRENT_TIMESTAMP(), status = "T"');
$q->execute();
$q = $db->prepare('INSERT INTO `OA-SS_Queue`'
		.' SET bookingid = LAST_INSERT_ID(), mapid = ?, tierid = ?, quantity = ?,'
		.' status = "P", dateadded = CURRENT_TIMESTAMP(), priority = ?, ExpiryTime = ?');
$q->execute($map, $tier, $qty, $prio, 3600);
my $queueid = $db->last_insert_id(undef, undef, 'OA-SS_Queue', 'queueid');

# Send notification

use JSON::RPC::Client;
my $client = new JSON::RPC::Client;
my $r = $client->call($serverrpc, { method => 'process', params => [$queueid, $tier] });
print(($r ? $r->result : $client->status_line), "\n");
