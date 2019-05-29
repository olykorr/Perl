#!/usr/bin/perl

#writed by user16

use strict;
use warnings;
#Подключаем системные библиотеки
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML :standart);
use CGI::Carp qw(fatalsToBrowser);
#use CGI::Cookie;
use File::Basename qw(dirname);
use Data::Dumper;
#Подключаем локальные библиотеки а так же папку проекта
use lib dirname(__FILE__) . '';
use lib '.';
use lib dirname(__FILE__) . '/libs';
#Подключаем наши класы
use ProgramConfig;
use Router::router;
#use Tools::Session;

my %in;
ReadParse(\%in);

#Устанавливаем базовую дерикторию где лежат наши шаблоны страниц
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
    
    



