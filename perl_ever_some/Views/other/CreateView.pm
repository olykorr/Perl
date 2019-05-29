#writed by user14
package Views::CreateView;

use strict;
use warnings;
use HTML::Template;
use Views::IView;

our @ISA = qw(Views::IView);

my $title = 'Page New Article';

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless({}, $_[0]);
}

sub getTemplate
{
    return HTML::Template->new(filename => 'templates/create.tmpl');
}

return 1;
