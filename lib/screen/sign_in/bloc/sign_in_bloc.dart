import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/bloc/sign_in_event.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/bloc/sign_in_state.dart';
import 'package:mukgen_flutter_v1/service/auth_service.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(Empty()) {
    on<PressedButton>((event, emit) async {
      try {
        emit(Loading());
        final loginResponse = await AuthService.postLoginInfo(event.accountId, event.password);
        emit(Loaded(loginResponse: loginResponse));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}