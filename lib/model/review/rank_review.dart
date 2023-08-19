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
  String? userNickname;
  int? reviewCount;
  String? averageReview;

  RankReviewResponseList(
      {this.profileUrl, this.userNickname, this.reviewCount, this.averageReview});

  RankReviewResponseList.fromJson(Map<String, dynamic> json) {
    profileUrl = json['profileUrl'];
    userNickname = json['userNickname'];
    reviewCount = json['reviewCount'];
    averageReview = json['averageReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profileUrl'] = profileUrl;
    data['userNickname'] = userNickname;
    data['reviewCount'] = reviewCount;
    data['averageReview'] = averageReview;
    return data;
  }
}