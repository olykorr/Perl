#Writed by user13
package Auth::AuthManager; 

use strict;
use warnings;
use DB::UserOperations;
use ProgramConfig;
use ErrorHandler;
use Cryptograph;
use Data::Dumper;

our @ISA = qw(ErrorHandler);

my $config = ProgramConfig->new();
my $user = DB::UserOperations->new();
my $cryptor = Cryptograph->new();

sub new {
    my $class = ref($_[0]) || $_[0];
    return bless({}, $class);
}
=begin
sub Autorize ($$$) 
{
	my($self, $login, $pass) = @_;
	 
	my $resultHRef = $user->getByLogin($login);
	my %result= %{$resultHRef};
	if (%result)
		{
			my $respass = $result{'password'};
			if($cryptor->validate(\$respass, \$pass)){	
				my $session = $config->getSession();
				$session->setSessionElement('uid', $result{'id'});
				return 1;
				}
			else{
			$self->setError(1002); #wrong pass 
			return undef;
			}
		}
	else{
	$self->setError(1001); #no user with such login
	return undef;
	}
}


sub Is_Auth()
{
	my $session = $config->getSession();
	my $uid = $session->getSessionElement('uid');	
	return $uid;
}


sub getUser()
{
	my ($self) =@_;
	my $uid = $self->Is_Auth();
	if($uid) {
		my @rows = $user->getOne($uid);		
		return $rows[0];
	}
	return undef;
}

sub logout()
{
	$config->getSession->clearSessionElements(["uid"]);
}
=end
=cut
return 1;
