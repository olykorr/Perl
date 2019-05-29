#writed by user16
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

return 1;
