import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {}

class PressedButton extends SignInEvent {
  final String accountId;
  final String password;

  PressedButton({required this.accountId, required this.password});

  @override
  List<Object?> get props => [accountId, password];
}
