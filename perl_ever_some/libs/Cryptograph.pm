#Writed by user2
package Cryptograph;

use strict;
use warnings;

use Crypt::Password;

sub new {
    my $class = ref($_[0]) || $_[0];    
    return bless({}, $class);    
}


sub encode ($$) {
    my ($self, $pass) = @_;        
    return password($pass, "56", "md5");
}

sub validate($$$) {
    my ($self, $saved_crypt, $wild_password) = @_;
    return check_password( $$saved_crypt, $$wild_password );
}

return 1;
