# Writed by User 16

package Router::getMethod;


use strict;
use warnings;
use Router::routsConfig;
use Auth::AuthManager;
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

    if (($routes{$url[0]}) && ($url[0] ne 'logout')) {
        
	    $includeView = $routes{$url[0]};        	
        $self->loadView($routes{$url[0]});
    } elsif ($url[0] eq 'logout') {
        
        my $authManager = Auth::AuthManager->new();
        $authManager->logout();
            
        my @str = split(/index.cgi/, $ENV{'REQUEST_URI'});

        print "Content-type: text/html; charset=utf-8\nStatus: 302 Found\nLocation: "
        ."http://".$ENV{'HTTP_HOST'}.$str[0]."index.cgi/home"."\n\n";
    
    } else {
        $self->loadView('NotFoundView');
	#$includeView = 'NotFoundView';
    }
    
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
