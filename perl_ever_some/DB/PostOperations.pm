#writed by user2
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
    my $sql = "SELECT posts.title, posts.body, posts.dat,".
    " users.firstname, users.lastname FROM posts".
    " LEFT JOIN users ON posts.idauthor=users.id WHERE posts.status=0";
    return $self->getConnection()->select($sql);
}

sub findAll() {
	my ($self) = @_;
    my $sql = "SELECT posts.title, posts.body, posts.dat,".
    " users.firstname, users.lastname FROM posts".
    " LEFT JOIN users ON posts.idauthor=users.id WHERE 1=1";
	return $self->getConnection()->select($sql);
}

sub getOne($) {
	my ($self) = @_;
       my $sql = "SELECT posts.title, posts.body, posts.dat,".
	" users.firstname, users.lastname FROM posts".
	" LEFT JOIN users ON posts.idauthor=users.id posts WHERE posts.id=?";
	return $self->getConnection()->select($sql,($_[1]));
}


return 1;
