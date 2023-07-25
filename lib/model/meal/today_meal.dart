class TodayMeal {
  List<ResponseList>? responseList;

  TodayMeal({this.responseList});

  TodayMeal.fromJson(Map<String, dynamic> json) {
    if (json['responseList'] != null) {
      responseList = <ResponseList>[];
      json['responseList'].forEach((v) {
        responseList!.add(ResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (responseList != null) {
      data['responseList'] = responseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseList {
  String? riceType;
  List<String>? items;
  int? riceId;

  ResponseList({this.riceType, this.items, this.riceId});

  ResponseList.fromJson(Map<String, dynamic> json) {
    riceType = json['riceType'];
    items = json['items'].cast<String>();
    riceId = json['riceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['riceType'] = riceType;
    data['items'] = items;
    data['riceId'] = riceId;
    return data;
  }
}
