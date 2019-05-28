#writed by user16
package Views::IView;

use base ErrorHandler;

use strict;
use warnings;
use HTML::Template;

my $title = '';

sub getHeader
{
	my ($self) = @_;
    my $headtmpl = HTML::Template->new(filename => 'templates/header.tmpl');
    $headtmpl->param(TITLE => $title);
    my $error = $self->checkError();
    if ($error)
    {
	   $headtmpl->param(ERROR => $error);
    }

    return $headtmpl->output;
}

sub getFooter
{
    my $footertmpl = HTML::Template->new(filename => 'templates/footer.tmpl');
    return $footertmpl->output;
}

sub generate
{
    my($self) = @_;
    return $self->getHeader($self).$self->getContent($self).$self->getFooter($self);
}

sub new;
sub getTemplate;

sub getContent($)
{
    my($self) = @_;
    return $self->getTemplate()->output;
}

return 1;
