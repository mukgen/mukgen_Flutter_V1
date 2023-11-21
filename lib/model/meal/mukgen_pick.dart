class MukGenPick {
  int? month;
  int? day;
  String? riceType;
  int? riceId;

  MukGenPick({this.month, this.day, this.riceType, this.riceId});

  MukGenPick.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    day = json['day'];
    riceType = json['riceType'];
    riceId = json['riceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['day'] = day;
    data['riceType'] = riceType;
    data['riceId'] = riceId;
    return data;
  }
}
