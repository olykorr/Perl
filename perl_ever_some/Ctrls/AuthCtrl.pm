#writed by user2
package Ctrls::AuthCtrl;

use base Ctrls::ICtrl;

use strict;
use warnings;

use Auth::AuthManager;
use Validators::UserValidate;

my $authservice = Auth::AuthManager->new();
my $validator = Validators::AuthValidate->new();

sub execute($$) {
    my ($self, $datahref) = @_;  
    if($self->checkValidation($datahref, $validator)) {
        return $authservice->Autorize($datahref->{'login'}, $datahref->{'password'});
    }
    return undef;
}

return 1;
