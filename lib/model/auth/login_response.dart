class LoginResponse {
  TokenResponse? tokenResponse;
  String? message;

  LoginResponse({this.tokenResponse, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    tokenResponse = json['tokenResponse'] != null
        ? TokenResponse.fromJson(json['tokenResponse'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tokenResponse != null) {
      data['tokenResponse'] = tokenResponse!.toJson();
    }
    data['message'] = message;
    return data;
  }

  // 초기 상태를 생성하는 메서드 추가
  static LoginResponse initial() {
    return LoginResponse(
      tokenResponse: null,
      message: null,
    );
  }
}

class TokenResponse {
  String? accessToken;
  String? refreshToken;

  TokenResponse({this.accessToken, this.refreshToken});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}