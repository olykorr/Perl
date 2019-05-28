#writed by user2
package ErrorHandler;

use strict;
use warnings;

use ProgramConfig;

my $config = ProgramConfig->new();

 sub setError($) {
	my ($self, $code) = @_;
	if($code) {
		$config->getSession()->setSessionElement('Error', $code);
	}

 }
 
 sub checkError() {	
	my ($self) = @_;
	my $code =  $config->getSession()->getSessionElement('Error');
	if($code) {
		$config->getSession->clearSessionElements(["Error"]);
		return $config->getErrorByCode($code) || "UNKNOWN ERROR";
	} esle {
		return undef;
	}

 }

return 1;
