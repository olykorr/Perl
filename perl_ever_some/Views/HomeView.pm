#writed by user14
package Views::HomeView;

use strict;
use warnings;
use HTML::Template;
use Views::IView;
use Auth::AuthManager;
use DB::PostOperations;
#use Views::AuthView;
#use Views::UserView;
use Data::Dumper;

our @ISA = qw(Views::IView);

my $title = 'Page Home';
my $user = Auth::AuthManager->new();

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
    #my $userId = $user->Is_Auth();

=begin
        if ($userId)
        {
            my $uref = $user->getUser($userId);
        my %userdata = %{$uref};

            my $username = $userdata{'firstname'}.' '.$userdata{'lastname'};
            my $usertmpl = Views::UserView->new()->getTemplate();
            $usertmpl->param(USERNAME => $username);
            $aside = $usertmpl->output;
            @articles = DB::PostOperations->new()->findAll();
        }
        else
        {
            $aside = Views::AuthView->new()->getTemplate()->output;
            @articles = DB::PostOperations->new()->getPublic();

        }
=end
=cut

    $hometmpl->param(ARTICLE => \@articles);
    
    $layout->param(CONTENT => $hometmpl->output);
    $layout->param(ASIDE => $aside);
    
    return $layout->output;
}

return 1;
