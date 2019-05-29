#writed by user16
package Views::HomeView;

use strict;
use warnings;
use HTML::Template;
use Views::IView;
use DB::PostOperations;
use Data::Dumper;

our @ISA = qw(Views::IView);

my $title = 'Page Home';


sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless({}, $_[0]);
}

sub getTemplate
{
    return HTML::Template->new(filename => 'templates/home.tmpl');
}

sub getContent
{
    my ($self) = @_;
    my $layout = HTML::Template->new(filename => 'templates/layout.tmpl');
    
    my $hometmpl = $self->getTemplate();
    my $aside;
    my @articles;
    @articles = DB::PostOperations->new()->findAll();
      
    $hometmpl->param(ARTICLE => \@articles);
    
    $layout->param(CONTENT => $hometmpl->output);
    $layout->param(ASIDE => $aside);
    
    return $layout->output;
}

return 1;
