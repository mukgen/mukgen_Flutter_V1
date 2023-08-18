class ProfileUser {
  String? accountId;
  String? name;
  String? profileUrl;
  String? phoneNumber;
  String? mail;

  ProfileUser(
      {this.accountId,
        this.name,
        this.profileUrl,
        this.phoneNumber,
        this.mail});

  ProfileUser.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    name = json['name'];
    profileUrl = json['profileUrl'];
    phoneNumber = json['phoneNumber'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['name'] = name;
    data['profileUrl'] = profileUrl;
    data['phoneNumber'] = phoneNumber;
    data['mail'] = mail;
    return data;
  }
}
