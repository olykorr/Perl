# Writed by User 10

package Router::routsConfig;


use strict;
use warnings;
use Data::Dumper;


sub new {
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


# For GET method: 'URL' => 'View file name'
sub getMethodRoutes
{
    my %routes = (
        ''              => 'HomeView',
        'home'          => 'HomeView',
        'logout'        => '',
        'registration'  => 'RegView',
        'create'        => 'CreateView'
    );
    return %routes;
}

# For POST method: 'URL' => 'Controller file name'
sub postMethodRoutes
{
    my %routes = (
        ''              => 'AuthCtrl',
        'home'          => 'AuthCtrl',
        'create'        => 'CreateCtrl',
        'registration'  => 'RegistrationCtrl',
        'auth'          => 'AuthCtrl'
    );
    return %routes;
}

1;
