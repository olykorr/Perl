#writed by user17
package Validators::AuthValidate;

use base Validators::Ivalidator;
use strict;
use warnings;

use Data::Dumper;

my @authField= qw(login password);

sub validFields{
	my ($self, $href)=@_;
	for my $key (@authField){
		if (!defined($href->{$key})){
			#print $key." is missing\n";
			$self->setError(2000);
			return undef;
		}
	}
	return 1;
}

#Login check: 
#6..50 symbols
#first symbol must be letter
#letters and symbol '_'
sub validLogin{
	my ($self, $login)=@_;
	if ($login !~ /^[a-zA-Z][a-zA-Z0-9_\.]{5,49}$/){
		$self->setError(2000);
		#print "Login Error\n";
		return undef;
	}
	return 1;

}

#password check:
#>6 symbols
#necessary: 1 uppercase letter, 1 lowercase, 1 digit
sub validPass{
	my ($self, $pass)=@_;
	if ($pass !~ /(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/){
		$self->setError(2000);
		#print "Pass Error\n";
		return undef;
	}
	return 1;
}

sub validateUser{
	my ($self, $href)=@_;
	if (($self->validLogin($href->{'login'})) && ($self->validPass($href->{'password'})) ){
		return 1;
	}else {return undef};
}

sub validate{
	my ($self, $href)=@_;
	if (($self->firstValidate($href)) && ($self->validFields($href)) && ($self->validateUser($href)) ){
		return 1;
	}else {return undef};
}

return 1;
