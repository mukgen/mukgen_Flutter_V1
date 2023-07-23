class RankReview {
  List<RankReviewResponseList>? reviewRankResponseList;

  RankReview({this.reviewRankResponseList});

  RankReview.fromJson(Map<String, dynamic> json) {
    if (json['reviewRankResponseList'] != null) {
      reviewRankResponseList = <RankReviewResponseList>[];
      json['reviewRankResponseList'].forEach((v) {
        reviewRankResponseList!.add(RankReviewResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewRankResponseList != null) {
      data['reviewRankResponseList'] =
          reviewRankResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RankReviewResponseList {
  String? profileUrl;
  String? userName;
  int? reviewCount;
  String? averageReview;

  RankReviewResponseList(
      {this.profileUrl, this.userName, this.reviewCount, this.averageReview});

  RankReviewResponseList.fromJson(Map<String, dynamic> json) {
    profileUrl = json['profileUrl'];
    userName = json['userName'];
    reviewCount = json['reviewCount'];
    averageReview = json['averageReview'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileUrl'] = profileUrl;
    data['userName'] = userName;
    data['reviewCount'] = reviewCount;
    data['averageReview'] = averageReview;
    return data;
  }
}