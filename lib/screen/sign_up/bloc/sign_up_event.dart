import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {}

class LoadEmailInput extends SignUpEvent {
  final String mail;

  LoadEmailInput({required this.mail});

  @override
  List<Object?> get props => [mail];
}

class LoadEmailConfirm extends SignUpEvent {
  final String mail;
  final String code;

  LoadEmailConfirm({required this.code, required this.mail});

  @override
  List<Object?> get props => [code, mail];
}

class ReloadEmailInput extends SignUpEvent {
  final String mail;

  ReloadEmailInput({required this.mail});

  @override
  List<Object?> get props => [mail];
}

class LoadIdDuplicate extends SignUpEvent {
  final String id;


  LoadIdDuplicate({required this.id});

  @override
  List<Object?> get props => [id];
}

class LoadSignUp extends SignUpEvent {
  final String nickname;
  final String accountId;
  final String password;
  final String passwordCheck;
  final String phoneNumber;
  final String mail;

  LoadSignUp({required this.nickname, required this.accountId, required this.password, required this.passwordCheck, required this.phoneNumber, required this.mail});

  @override
  List<Object?> get props => [nickname, accountId, password, passwordCheck, phoneNumber, mail];
}

class ResetEvent extends SignUpEvent {

  @override
  List<Object?> get props => [];
}