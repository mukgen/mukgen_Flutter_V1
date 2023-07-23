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
  String? userName;
  String? riceType;
  int? reviewId;

  ReviewResponseList(
      {this.riceId,
        this.count,
        this.review,
        this.userName,
        this.riceType,
        this.reviewId});

  ReviewResponseList.fromJson(Map<String, dynamic> json) {
    riceId = json['riceId'];
    count = json['count'];
    review = json['review'];
    userName = json['userName'];
    riceType = json['riceType'];
    reviewId = json['reviewId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['riceId'] = riceId;
    data['count'] = count;
    data['review'] = review;
    data['userName'] = userName;
    data['riceType'] = riceType;
    data['reviewId'] = reviewId;
    return data;
  }
}
