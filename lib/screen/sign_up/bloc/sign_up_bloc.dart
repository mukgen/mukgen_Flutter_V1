import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mukgen_flutter_v1/model/auth/duplicate_response.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_event.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_state.dart';
import 'package:mukgen_flutter_v1/service/auth_service.dart';
import 'package:mukgen_flutter_v1/service/mail_service.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(Empty()) {
    on<LoadEmailInput>((event, emit) async {
      try {
        emit(Loaded(
            response: MailService.postSendMailInfo(event.mail).toString()));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });

    on<LoadEmailConfirm>((event, emit) async {
      try {
        final confirm =
            await MailService.postAuthenticateMailInfo(event.mail, event.code);
        if (confirm == false) {
          throw Exception();
        } else {
          emit(Loaded(response: confirm.toString()));
        }
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });

    on<ReloadEmailInput>((event, emit) async {
      try {
        emit(Reloaded(
            response: MailService.postSendMailInfo(event.mail).toString()));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });

    on<LoadIdDuplicate>((event, emit) async {
      try {
        final DuplicateResponse response =
            await AuthService.getDuplicateInfo(event.id);
        if (response.duplicate == true) {
          throw Exception();
        } else {
          emit(Loaded(response: response.toString()));
        }
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });

    on<LoadSignUp>((event, emit) async {
      try {
        emit(Loaded(
            response: AuthService.postGeneralSignupInfo(
          event.nickname,
          event.accountId,
          event.password,
          event.passwordCheck,
          event.phoneNumber,
          event.mail,
        ).toString()));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });

    on<ResetEvent>((event, emit) => emit(Empty()));
  }
}
