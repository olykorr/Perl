#writed by user14
package Views::RegView;

use strict;
use warnings;
use HTML::Template;
use Views::IView;

our @ISA = qw(Views::IView);

my $title = 'Page Registration';

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless({}, $_[0]);
}

sub getTemplate
{
    return HTML::Template->new(filename => 'templates/reg.tmpl');
}

return 1;