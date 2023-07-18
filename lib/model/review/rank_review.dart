class ReviewRank {
  List<ReviewRankResponseList>? reviewRankResponseList;

  ReviewRank({this.reviewRankResponseList});

  ReviewRank.fromJson(Map<String, dynamic> json) {
    if (json['reviewRankResponseList'] != null) {
      reviewRankResponseList = <ReviewRankResponseList>[];
      json['reviewRankResponseList'].forEach((v) {
        reviewRankResponseList!.add(ReviewRankResponseList.fromJson(v));
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

class ReviewRankResponseList {
  String? profileUrl;
  String? userName;
  int? reviewCount;
  String? averageReview;

  ReviewRankResponseList(
      {this.profileUrl, this.userName, this.reviewCount, this.averageReview});

  ReviewRankResponseList.fromJson(Map<String, dynamic> json) {
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