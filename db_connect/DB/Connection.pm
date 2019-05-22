package DB::Connection;

use strict;
use warnings;

use DBI;
use Data::Dumper;

my $driver;
my $host;
my $dbname;
my $user;
my $password;

my $dbh;

sub new {

my $package = shift @_; #this string 


($driver, $host, $dbname, $user, $password) = @_;

my $class = ref($package) || $package;
my $self = {};
bless($self, $class);
$self->connect();
return $self;
}

sub connect {
	my $dsn = "$driver:$dbname:$host";
	$dbh ||= DBI->connect($dsn, $user, $password, {PrintError => 1}) || 
	die "can`t connect to db server \n $@";
    	
	return $dbh;
}

sub getConnection {	
	my ($self) = @_; #this string 
	$self->connect();
    	
	return $dbh;
}

my $quoteParams = sub {
	my @inputParams=@_;
	my @params = ();
	foreach my $variable (@inputParams) { 		
		$dbh->quote($variable);#quote find
        print "!!!";
        print $variable;
         print "\n";
		push(@params, $variable);# put at array params variable
	} 
	return @params;
};

my $execute = sub {
	my ($sth, @inputParams) = @_;
	my @params = $quoteParams->(@inputParams); 
	$sth->execute(@params);
};

sub select {	
	my ($self, $sql, @params) = @_;
	$self->connect();

	if($sql){
		my $sth = $dbh->prepare($sql);
		$execute->($sth, @params);				
		my @result=();
		while(my $row = $sth->fetchrow_hashref()) {
			push(@result, $row);
		}
		$sth->finish();
		return @result;	
	} else {
		print "Sql request IS empty!!!";
	}
}

sub do { #give query text at variable and parameters, to put at this query
	my ($self, $sql, @params) = @_;
	$self->connect();
	my $rows;
	
	@params = $quoteParams->(@params);  

	if($sql) {
		$rows = $dbh->do($sql, undef, @params);
		if($dbh->errstr){
			print $dbh->errstr;
		}
        print $rows;
		return $rows;
	} else {
		print "Sql request IS empty!!!";
	}
}

sub last_inserted_id {
	shift @_;
	my ($catalog, $schema, $table, $field) = @_;

	return $dbh->last_insert_id($catalog, $schema, $table, $field);
}

sub disconnect {
	eval {
		$dbh->disconnect();
	};
	if ($@) {
		print "Can`t Disconnect from DB\n ERROR:$@";
	}	
}

sub DESTROY {
	disconnect();
}


return 1;
