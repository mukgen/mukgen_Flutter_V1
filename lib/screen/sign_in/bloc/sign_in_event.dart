import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {}

class LoadSignIn extends SignInEvent {
  final String accountId;
  final String password;

  LoadSignIn({required this.accountId, required this.password});

  @override
  List<Object?> get props => [accountId, password];
}
