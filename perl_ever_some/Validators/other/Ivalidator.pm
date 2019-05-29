#writed by user17
package Validators::Ivalidator;

use base ErrorHandler;
use ProgramConfig;
use strict;
use warnings;

use Data::Dumper;

my $config = ProgramConfig->new();

sub new{
my ($class) = shift @_;
	return bless({}, $class);
}

sub isEmpty{
	my $self = $_[0];
	my %hash = %{$_[1]};
	for my $key ( keys %hash ) {
      	if (!defined($hash{$key}) || !defined($config->getValidation($key)) || ($hash{$key} eq "")) {
			#print $key." is empty\n";
			$self->setError(2000);
			return undef;
   		}
	}
	return 1;
}

sub validLength{
	my $self = $_[0];
	my %hash = %{$_[1]};
	for my $key ( keys %hash ) {
		if ( length($hash{$key})>$config->getValidation($key) ){
			#print $key." must be shorter\n";
			$self->setError(2000);
			return undef;
		}
	}
	return 1;
}

sub firstValidate{
	my ($self, $href)=@_;
	if (($self->isEmpty($href)) && ($self->validLength($href))){
		return 1;
	}
}

sub validate{
	my ($self, $href)=@_;
	if ( $self->firstValidate($href) ){
		return 1;
	}
}

return 1;
