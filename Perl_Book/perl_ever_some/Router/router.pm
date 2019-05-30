# Writed by User 16

package Router::router;

use strict;
use warnings;
use Data::Dumper;
use Router::getMethod;
use Router::postMethod;

sub new {
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


sub index
{
    my ($self, $inRef) = @_;

    my @url = $self->_urlParser();

    my $reqMethod = $self->_getRequestMethod();

    if ( $reqMethod ne 'POST' ) {

        my $obj = Router::getMethod->new();
        $obj->index(@url);

    } else {

        my $obj = Router::postMethod->new();
        $obj->index($inRef, @url);
    }
}



sub _getRequestMethod
{
    my $reqMethod;

    if ($ENV{'REQUEST_METHOD'} eq 'POST')
    {
        $reqMethod = 'POST';

    } else {

        $reqMethod = 'GET';
    }

    return $reqMethod;
}



sub _urlParser
{
    my @str = split(/index.cgi/, $ENV{'REQUEST_URI'});

    my @arr = split(/\//, $str[1]);

    shift @arr;

    return @arr;
}



1;
