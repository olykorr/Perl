#writed by user16
package DB::PostOperations;

use base DB::Ioperations;

use strict;
use warnings;

sub new {
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    bless($self, $class);
    $self->setTableName('posts');
    return $self;
}

sub getPublic() {
    my ($self) = @_;
    my $sql = "SELECT ".
    " FROM ".
    " LEFT JOIN ...ON ";
    return $self->getConnection()->select($sql);
}

sub findAll() {
	my ($self) = @_;
    my $sql = "SELECT ".
    " FROM ".
    " LEFT JOIN ... ON  WHERE ";
	return $self->getConnection()->select($sql);
}

sub getOne($) {
	my ($self) = @_;
       my $sql = "SELECT ".
	" FROM ".
	" LEFT JOIN ... ON ";
	return $self->getConnection()->select($sql,($_[1]));
}


return 1;
