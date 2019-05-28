# Writed by User 10

package Router::postMethod;

use strict;
use warnings;
use Router::routsConfig;
use Data::Dumper;
use Views::NotFoundView;

sub new {
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


sub index
{
    my ($self, $inRef, @url) = @_;

    my $obj = Router::routsConfig->new();
    my %routes = $obj->postMethodRoutes();

    my $includeCtrl;

    if ($routes{$url[0]}) {
        
        $includeCtrl = $routes{$url[0]};
        
    } else {

        my $view = Views::NotFoundView->new();

        print "Content-type: text/html; charset=utf-8\n\n";
        print $view->generate();
    }

    
    my $req = 'Ctrls/'.$includeCtrl.'.pm';
    require $req;
    
    my $ctrl = "Ctrls::$includeCtrl"->new();

    if($ctrl->execute($inRef)) {
        my @str = split(/index.cgi/, $ENV{'REQUEST_URI'});
        print "Content-type: text/html; charset=utf-8\nStatus: 302 Found\nLocation: "
           .$str[0]."index.cgi/home"."\n\n"; 
       
    } else {
        print "Content-type: text/html; charset=utf-8\nStatus: 302 Found\nLocation: "
        .$ENV{'REQUEST_URI'}."\n\n"; 
    }

}

1;
