import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {}

class Empty extends SignUpState {
  @override
  List<Object> get props => [];
}

class Error extends SignUpState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}

class Loaded extends SignUpState {
  final String response;

  Loaded({required this.response});

  @override
  List<Object> get props => [response];
}

class Reloaded extends SignUpState { // API를 다시 전송 했을 때 Loaded로 상태가 변경되어 화면이 넘어가는 것을 방지
  final String response;

  Reloaded({required this.response});

  @override
  List<Object> get props => [response];
}