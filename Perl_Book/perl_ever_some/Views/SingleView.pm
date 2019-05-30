#writed by user14
package Views::SingleView;

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
    return HTML::Template->new(filename => 'templates/singleBook.tmpl');
}


sub getContent
{
    my ($self) = @_;
    my $layout = HTML::Template->new(filename => 'templates/layout.tmpl');
    
    my $booktmpl = $self->getTemplate();
    my $aside;
    my @book;
    @book = DB::PostOperations->new()->getOne(12);
    print  @book;

    $booktmpl->param(ARTICLE => \@book);
    
    $layout->param(CONTENT => $booktmpl->output);
    $layout->param(ASIDE => $aside);
    
    return $layout->output;
}

return 1;




