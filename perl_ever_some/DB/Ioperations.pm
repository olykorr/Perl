#writed by user2
package DB::Ioperations;

use base ErrorHandler;

use strict;
use warnings;

use DB::Connector;

my $connection = DB::Connector->new("DBI:mysql","localhost","user2","user2","user2");
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

sub save ($) {
	my ($self) = @_;
    my %item = %{$_[1]};
    my $id = $item{'id'};
    delete $item{'id'};
    my @fields = keys %item;
    my @values = map { $item{$_} } @fields;
    my $sql = "";
    if($id) {
	$sql = $sql."UPDATE $tableName SET ". join( '=?,', @fields ) . "=? WHERE id=$id";;
    } else {
	my @valuesmap = map ('?',1..@values);
	$sql = $sql."INSERT INTO $tableName (".join(", ", @fields).") VALUES (".join(", ", @valuesmap).")";
    }
    my $result = $self->getConnection()->do($sql,@values);
    unless($result>0) {
        $self->setError(3000);
    }
    return $result;
}

sub remove($) {
	my ($self) = @_;
    my $sql = "DELETE FROM $tableName WHERE id=?";
    my $result = $self->getConnection()->do($sql, ($_[1]));
    unless($result>0) {
        $self->setError(3000);
    }
    return $result;
}

return 1;
