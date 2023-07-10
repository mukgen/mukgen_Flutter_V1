class UserProfile {
  String? accountId;
  String? name;
  String? phoneNumber;
  String? profileUrl;

  UserProfile({this.accountId, this.name, this.phoneNumber, this.profileUrl});

  UserProfile.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['profileUrl'] = profileUrl;
    return data;
  }
}