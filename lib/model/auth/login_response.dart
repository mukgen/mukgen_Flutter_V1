class LoginResponse {
  TokenResponse? tokenResponse;
  String? message;

  LoginResponse({this.tokenResponse, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    tokenResponse = json['tokenResponse'] != null
        ? new TokenResponse.fromJson(json['tokenResponse'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tokenResponse != null) {
      data['tokenResponse'] = this.tokenResponse!.toJson();
    }
    data['message'] = this.message;
    return data;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}