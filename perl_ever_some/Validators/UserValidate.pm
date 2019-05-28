#writed by user17
package Validators::UserValidate;

use base Validators::AuthValidate;

use strict;
use warnings;

use Data::Dumper;
my @userField= qw(login password firstname lastname email);
sub validName{
	my $self=$_[0];
	my $name=$_[1];
	if ( $name =~ /\W|\d/ ){
		$self->setError(2000);
		#print "Name error\n";
		return undef;
	}
	return 1;
	
}

sub validFields{
	my ($self, $href)=@_;
	#print Dumper(keys %{$href});
	for my $key (@userField){
		if (!defined($href->{$key})){
			#print $key." is missing\n";
			$self->setError(2000);
			return undef;
		}
	}
	return 1;
}

sub validEmail{
	my ($self, $email)=@_;
	if ( $email !~ /^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$/ ){
		#print "E-mail Error\n";
		$self->setError(2000);
		return undef;
	}
	return 1;
}

sub validate{
	my ($self, $href)=@_;
	if (($self->firstValidate($href)) && ($self->validFields($href)) && ($self->validateUser($href)) && ($self->validName($href->{'firstname'})) && ($self->validName($href->{'lastname'})) && ($self->validEmail($href->{'email'})) ){
		return 1;
	}else {return undef};
}

return 1;
