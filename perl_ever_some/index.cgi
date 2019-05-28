#!/usr/bin/perl

#writed by user2

use strict;
use warnings;
#Подключаем системные библиотеки
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML :standart);
use CGI::Carp qw(fatalsToBrowser);
use CGI::Cookie;
use File::Basename qw(dirname);
use Data::Dumper;
#Подключаем локальные библиотеки а так же папку проекта
use lib dirname(__FILE__) . '';
use lib '.';
use lib dirname(__FILE__) . '/libs';
#Подключаем наши класы
use ProgramConfig;
use Router::router;
use Tools::Session;

my %in;
ReadParse(\%in);

#Устанавливаем базовую дерикторию где лежат наши шаблоны страниц
$ENV{HTML_TEMPLATE_ROOT}=dirname(__FILE__);

my $cgi = CGI->new;

my $config = ProgramConfig->new();

#Работаем с сессией и куками
my $session;
my %cookies = fetch CGI::Cookie;


$session = Tools::Session->new();		
$session->set('sessionDir', dirname(__FILE__) ."/sessions");
$session->set('sessionExpires', "+2w");

sub refreshCookies {
    my $sesheader =  $session->getCookieWithSid();
    chomp $sesheader;
    print $sesheader;
    my $url = $cgi->param('url');    
    print $cgi->redirect($url);
}

my $cookieSid;
eval {
	$cookieSid= $cookies{'CGISESSID'}->value;
};

if($cookieSid) {    
    $session->set('sid', $cookieSid);
    $session->sessionStart() || die "Somsing wrong wich session";
    $config->setSession(\$session);
    #Flush for corect work
    $session->flush();
    unless($cookieSid eq $session->getSid()) {
	&refreshCookies();
    }
    
    #Тут вызов роутера!!!!
   eval {
	    Router::router->new()->index(\%in);
	    };
	     if ($@)  {
                print "Status:500\nContent-type: text/html; charset=utf-8\n\n <h1>500</h1> <br>";
	            print "$@";      
	    }
    
    
} else {    
    $session->sessionStart() || die "Somsing wrong wich session";
    #Flush for corect work
    $session->flush();
    &refreshCookies();
}


