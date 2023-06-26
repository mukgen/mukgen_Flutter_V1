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
  String? userName;
  String? reviewCount;
  String? averageReveiw;

  ReviewRankResponseList({this.userName, this.reviewCount, this.averageReveiw});

  ReviewRankResponseList.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    reviewCount = json['reviewCount'];
    averageReveiw = json['averageReveiw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['reviewCount'] = reviewCount;
    data['averageReveiw'] = averageReveiw;
    return data;
  }
}
