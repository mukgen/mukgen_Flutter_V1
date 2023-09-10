import 'package:equatable/equatable.dart';
import 'package:mukgen_flutter_v1/model/auth/login_response.dart';

abstract class SignInState extends Equatable {}

class Empty extends SignInState {
  @override
  List<Object> get props => [];
}

class Loading extends SignInState {
  @override
  List<Object> get props => [];
}

class Error extends SignInState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Loaded extends SignInState {
  final LoginResponse loginResponse;

  Loaded({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];
}