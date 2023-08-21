class ProfileUser {
  String? accountId;
  String? nickname;
  String? profileUrl;
  String? phoneNumber;
  String? mail;

  ProfileUser(
      {this.accountId,
        this.nickname,
        this.profileUrl,
        this.phoneNumber,
        this.mail});

  ProfileUser.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    nickname = json['nickname'];
    profileUrl = json['profileUrl'];
    phoneNumber = json['phoneNumber'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['nickname'] = nickname;
    data['profileUrl'] = profileUrl;
    data['phoneNumber'] = phoneNumber;
    data['mail'] = mail;
    return data;
  }
}
