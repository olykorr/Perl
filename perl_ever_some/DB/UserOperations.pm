#writed by user2
package DB::UserOperations;

use base DB::Ioperations;


use strict;
use warnings;

sub new {
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    bless($self, $class);
    $self->setTableName('users');
    return $self;
}

sub getByLogin($) {
    my ($self, $login) = @_;

    my $sql = "SELECT * FROM ".$self->getTableName()." WHERE login LIKE ?";
    my @rows = $self->getConnection()->select($sql, ($login));
    if(@rows > 0) {	    
	return $rows[0];
    } else {
	return undef;
    }
}

sub isLoginExist($) {
    my ($self, $login) = @_;
    my $result = $self->getByLogin($login);
    if($result) {
        return 1;
    }
    return undef;
}

return 1;
