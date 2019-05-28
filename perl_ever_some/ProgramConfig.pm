#writed by user2
package ProgramConfig;

use strict;
use warnings;

my $session;

my %errors = (
	1000 => "Ошибка Авторизации",
	1001 => "Пользователя не существует",
	1002 => "Проверте правильность введенного пароля",
	2000 => "Ошибка Валидации",
	3000 => "Невозможно обработать запрос",
	3001 => "Пользователь с таким именем уже существует",
	3002 => "Данные не пришли!",
	3003 => "Неудалось записать данные в базу",
);
my %map = ();
my %valid = (
	'login'=>25,
	'password'=>500,
	'firstname'=>50,
	'lastname'=>50,
	'email'=>100,
	'title'=>300,
	'body'=>10000,
	'status'=>1
);

my $self;

sub new {
	my $class = ref($_[0])||$_[0];
	$self ||= bless({},$class);
	return $self;
}

sub getErrorByCode($) {
	return $errors{$_[1]};
}

sub getValidation($) {
	return $valid{$_[1]};
}

sub setValue($$) {
	my ($self, $code, $value) = @_;
	$map{$code}=$value;
}

sub getValue($) {
	return $map{$_[1]};
}

sub setSession($) {
	$session= ${$_[1]};
}

sub getSession() {
	return $session;
}

return 1;
