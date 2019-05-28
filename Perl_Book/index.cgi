#!/usr/bin/perl

#writed by user16

use strict;
use warnings;
#Подключаем системные библиотеки
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML :standart);
use CGI::Carp qw(fatalsToBrowser);
use File::Basename qw(dirname);
use Data::Dumper;

#Add libs, project folder
use lib dirname(__FILE__) . '';
use lib '.';
use lib dirname(__FILE__) . '/libs';
#Подключаем наши класы
use ProgramConfig;
use Router::router;

my %in;
ReadParse(\%in);

#Set template dir
$ENV{HTML_TEMPLATE_ROOT}=dirname(__FILE__);

my $cgi = CGI->new;

my $config = ProgramConfig->new();


#Тут вызов роутера!!!!
   eval {
	    Router::router->new()->index(\%in);
	    };
	     if ($@)  {
                print "Status:500\nContent-type: text/html; charset=utf-8\n\n <h1>500</h1> <br>";
	            print "$@";      
	    }



