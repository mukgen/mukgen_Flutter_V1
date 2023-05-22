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
  String? item;
  int? riceId;

  ResponseList({this.item, this.riceId});

  ResponseList.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    riceId = json['riceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['riceId'] = riceId;
    return data;
  }
}
