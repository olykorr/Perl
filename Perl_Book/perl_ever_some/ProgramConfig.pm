#writed by user16
package ProgramConfig;

use strict;
use warnings;

my $session;

my %errors = (
	1000 => "Ошибка Валидации",
	2000 => "Невозможно обработать запрос",
	
);
my %map = ();
my %valid = (
	'status'=>1
);

my $self;

sub new {
	my $class = ref($_[0])||$_[0];
	$self ||= bless({},$class);
	return $self;
}

sub getErrorByCode($) {
	return $errors{$_[1]};
}

sub getValidation($) {
	return $valid{$_[1]};
}

sub setValue($$) {
	my ($self, $code, $value) = @_;
	$map{$code}=$value;
}

sub getValue($) {
	return $map{$_[1]};
}



return 1;
