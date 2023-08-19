class TodayReview {
  List<ReviewResponseList>? reviewResponseList;

  TodayReview({this.reviewResponseList});

  TodayReview.fromJson(Map<String, dynamic> json) {
    if (json['reviewResponseList'] != null) {
      reviewResponseList = <ReviewResponseList>[];
      json['reviewResponseList'].forEach((v) {
        reviewResponseList!.add(ReviewResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewResponseList != null) {
      data['reviewResponseList'] =
          reviewResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewResponseList {
  int? riceId;
  int? count;
  String? review;
  String? userNickname;
  String? createdAt;
  String? riceType;
  int? reviewId;

  ReviewResponseList(
      {this.riceId,
        this.count,
        this.review,
        this.userNickname,
        this.createdAt,
        this.riceType,
        this.reviewId});

  ReviewResponseList.fromJson(Map<String, dynamic> json) {
    riceId = json['riceId'];
    count = json['count'];
    review = json['review'];
    userNickname = json['userNickname'];
    createdAt = json['createdAt'];
    riceType = json['riceType'];
    reviewId = json['reviewId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['riceId'] = riceId;
    data['count'] = count;
    data['review'] = review;
    data['userNickname'] = userNickname;
    data['createdAt'] = createdAt;
    data['riceType'] = riceType;
    data['reviewId'] = reviewId;
    return data;
  }
}
