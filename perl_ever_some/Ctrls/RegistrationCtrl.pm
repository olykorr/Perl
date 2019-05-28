#writed by user2
package Ctrls::RegistrationCtrl;

use base Ctrls::ICtrl;

use strict;
use warnings;

use DB::UserOperations;
use Cryptograph;
use Validators::UserValidate;
use Auth::AuthManager;

my $dataservice = DB::UserOperations->new();
my $validator = Validators::UserValidate->new();
my $cryptor = Cryptograph->new();
my $authManager = Auth::AuthManager->new();

my $store = sub {
    my ($self, $datahref) = @_;

    unless($dataservice->isLoginExist($datahref->{'login'})) {
	    $datahref->{'password'} = $cryptor->encode($datahref->{'password'});
        return  $dataservice->save($datahref);
    }

    $self->setError(3003);
    return undef;
};

sub execute {
	my ($self, $datahref) = @_;  
	if($self->checkValidation($datahref, $validator)) {
    my $pass = $datahref->{'password'};
	my $result = $store->($self, $datahref);
    if($result)
    {
        $authManager->Autorize($datahref->{'login'}, $pass);
        return $result;
    }
	}
	return undef;
}

return 1;
