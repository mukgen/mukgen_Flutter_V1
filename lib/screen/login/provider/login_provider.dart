import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/model/auth/login_response.dart';
import 'package:mukgen_flutter_v1/service/auth_service.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginResponse>(
    (ref) => LoginViewModel());

class LoginViewModel extends StateNotifier<LoginResponse> {
  LoginViewModel() : super(LoginResponse.initial());

  void tryLogin({
    required String accountId,
    required String password,
  }) async {
    try {
      final result = await AuthService.postLoginInfo(accountId, password);
      state = result;
    } catch (e) {
      state = LoginResponse.initial();
    }
  }
}
