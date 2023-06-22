class ReviewRank {
  List<ReviewRankResponseList>? reviewRankResponseList;

  ReviewRank({this.reviewRankResponseList});

  ReviewRank.fromJson(Map<String, dynamic> json) {
    if (json['reviewRankResponseList'] != null) {
      reviewRankResponseList = <ReviewRankResponseList>[];
      json['reviewRankResponseList'].forEach((v) {
        reviewRankResponseList!.add(new ReviewRankResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviewRankResponseList != null) {
      data['reviewRankResponseList'] =
          this.reviewRankResponseList!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['reviewCount'] = this.reviewCount;
    data['averageReveiw'] = this.averageReveiw;
    return data;
  }
}
