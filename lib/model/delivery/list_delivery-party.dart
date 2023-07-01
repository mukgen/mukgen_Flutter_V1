class ListDeliveryParty {
  List<DeliveryPartyResponseList>? deliveryPartyResponseList;

  ListDeliveryParty({this.deliveryPartyResponseList});

  ListDeliveryParty.fromJson(Map<String, dynamic> json) {
    if (json['deliveryPartyResponseList'] != null) {
      deliveryPartyResponseList = <DeliveryPartyResponseList>[];
      json['deliveryPartyResponseList'].forEach((v) {
        deliveryPartyResponseList!
            .add(DeliveryPartyResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (deliveryPartyResponseList != null) {
      data['deliveryPartyResponseList'] =
          deliveryPartyResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryPartyResponseList {
  List<UserInfoResponseList>? userInfoResponseList;
  String? menu;
  String? place;
  String? meetTime;
  int? deliveryPartyId;
  int? participantNumber;
  int? curParticipantNumber;

  DeliveryPartyResponseList(
      {this.userInfoResponseList,
        this.menu,
        this.place,
        this.meetTime,
        this.deliveryPartyId,
        this.participantNumber,
        this.curParticipantNumber});

  DeliveryPartyResponseList.fromJson(Map<String, dynamic> json) {
    if (json['userInfoResponseList'] != null) {
      userInfoResponseList = <UserInfoResponseList>[];
      json['userInfoResponseList'].forEach((v) {
        userInfoResponseList!.add(UserInfoResponseList.fromJson(v));
      });
    }
    menu = json['menu'];
    place = json['place'];
    meetTime = json['meetTime'];
    deliveryPartyId = json['deliveryPartyId'];
    participantNumber = json['participantNumber'];
    curParticipantNumber = json['curParticipantNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userInfoResponseList != null) {
      data['userInfoResponseList'] =
          userInfoResponseList!.map((v) => v.toJson()).toList();
    }
    data['menu'] = menu;
    data['place'] = place;
    data['meetTime'] = meetTime;
    data['deliveryPartyId'] = deliveryPartyId;
    data['participantNumber'] = participantNumber;
    data['curParticipantNumber'] = curParticipantNumber;
    return data;
  }
}

class UserInfoResponseList {
  String? accountId;
  String? name;
  String? phoneNumber;
  String? profileUrl;

  UserInfoResponseList(
      {this.accountId, this.name, this.phoneNumber, this.profileUrl});

  UserInfoResponseList.fromJson(Map<String, dynamic> json) {
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
