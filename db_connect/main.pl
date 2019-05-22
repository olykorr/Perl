#!/usr/bin/perl


use strict;
use warnings;
use Data::Dumper;

use DB::Connection;

my $connector = DB::Connection->new("DBI:mysql","localhost","user16","user16","user16");

my $sql = "select * from Person";
my @result =  $connector->select($sql);
print Dumper(@result);

#my $insert_sql = "INSERT INTO Person (FirstName, LastName, Age) VALUES (?, ?, ?)";
#my $insertresult = $connector->do($insert_sql,('inserfromscript', 'tset', '1000'));
my $update_SQL = "UPDATE Person SET FirstName = ? WHERE LastName = 'inserfromscript'";
my $insertresult1 = $connector->do($update_SQL,('testPassed'));

#print Dumper($insertresult);
print Dumper($insertresult1);


