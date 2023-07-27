class TotalSuggestion {
  List<MealSuggestionResponseList>? mealSuggestionResponseList;

  TotalSuggestion({this.mealSuggestionResponseList});

  TotalSuggestion.fromJson(Map<String, dynamic> json) {
    if (json['mealSuggestionResponseList'] != null) {
      mealSuggestionResponseList = <MealSuggestionResponseList>[];
      json['mealSuggestionResponseList'].forEach((v) {
        mealSuggestionResponseList!
            .add(MealSuggestionResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mealSuggestionResponseList != null) {
      data['mealSuggestionResponseList'] =
          mealSuggestionResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealSuggestionResponseList {
  int? id;
  String? content;
  int? likeCount;
  int? dislikeCount;
  bool? checked;

  MealSuggestionResponseList(
      {this.id, this.content, this.likeCount, this.dislikeCount, this.checked});

  MealSuggestionResponseList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['likeCount'] = likeCount;
    data['dislikeCount'] = dislikeCount;
    data['checked'] = checked;
    return data;
  }
}