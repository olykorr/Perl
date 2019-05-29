#writed by user16
package DB::Ioperations;

use base ErrorHandler;

use strict;
use warnings;

use DB::Connector;

my $connection = DB::Connector->new("DBI:mysql","localhost","user16","user16","user16");
my $tableName="";

sub getConnection {
    return $connection;
}

sub setTableName($) {
    $tableName=$_[1];
}

sub getTableName() {
    return $tableName;
}

sub new();

sub findAll() {
	my ($self) = @_;
    my $sql = "SELECT * FROM $tableName WHERE 1=1";
    return $self->getConnection()->select($sql);
}
sub getOne($) {
	my ($self) = @_;
    my $sql = "SELECT * FROM $tableName WHERE 1=1 and id=?";
    return $self->getConnection()->select($sql,($_[1]));
}

return 1;
