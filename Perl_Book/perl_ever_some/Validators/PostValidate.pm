#writed by user16
package Validators::PostValidate;

use base Validators::Ivalidator;
use strict;
use warnings;

use Data::Dumper;

my @postField= qw(title body);

sub validTitle{
	my ($self, $title)=@_;
	if ( $title !~ /\w|\s/ ){
		$self->setError(2000);
		#print "Title Error\n";
		return undef;
	}
	return 1;
}

sub validFields{
		my ($self, $href)=@_;
		for my $key (@postField){
				if (!defined($href->{$key})){
						#print $key." is missing\n";
						$self->setError(2000);
						return undef;
				}
		}
		return 1;
}

sub validate{
	my ($self, $href)=@_;
	if (($self->firstValidate($href)) && ($self->validFields($href)) && ($self->validTitle($href->{'title'})) ){
		return 1;
	}else {return undef};
}

return 1;
