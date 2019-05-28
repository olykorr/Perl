#writed by user2
package Ctrls::CreateCtrl;

use base Ctrls::ICtrl;

use strict;
use warnings;

use DB::PostOperations;
use Validators::PostValidate;
use Auth::AuthManager;

my $dataservice = DB::PostOperations->new();
my $validator = Validators::PostValidate->new();

my $store = sub {
    my ($self, $datahref) = @_;
    my $result =  $dataservice->save($datahref);

    unless($result)
    {
        $self->setError(3003);
    }
    
    return $result;
};

sub execute($$) {
    my ($self, $datahref) = @_;  
    if($self->checkValidation($datahref, $validator)) {
	    my $authManager = Auth::AuthManager->new();
		my $uid = $authManager->Is_Auth();
	    if ($uid) {
			$datahref->{'idauthor'} = $uid;
		    return $store->($self, $datahref);
	    } else {
		    return undef;
	    }


    }
    return undef;
}

return 1;
