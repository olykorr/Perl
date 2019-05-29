# Writed by User 16

package Router::getMethod;


use strict;
use warnings;
use Router::routsConfig;
use Data::Dumper;


sub new {
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


sub index
{
    my ($self, @url) = @_;

    my $obj = Router::routsConfig->new();
    my %routes = $obj->getMethodRoutes();
	

    my $includeView;
    $includeView = $routes{$url[0]};        	
    $self->loadView($routes{$url[0]});


}


sub loadView {
	my ($self, $includeView) = @_;

    my $req = 'Views/'.$includeView.'.pm';
    require $req;

    my $view = "Views::$includeView"->new();

    print "Content-type: text/html; charset=utf-8\n\n";  
    print $view->generate();

}

1;
