#writed by user16
package Ctrls::ICtrl;

use base ErrorHandler;

use strict;
use warnings;

sub execute($$);

sub new {
    my $class = ref($_[0]) || $_[0];    
    return bless({}, $class);    
}

sub checkValidation($$$) {
    my ($self, $dataHRef, $validator) = @_;
    if ($dataHRef) {
        if($validator->validate($dataHRef)) {
            return 1;
        }
        return undef;
    }
    $self->setError(3002);
    return undef;
}

return 1;
