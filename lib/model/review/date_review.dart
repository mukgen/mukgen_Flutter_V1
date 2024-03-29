class DateReview {
  List<ReviewResponseList>? reviewResponseList;

  DateReview({this.reviewResponseList});

  DateReview.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? riceType;
  int? reviewId;

  ReviewResponseList(
      {this.riceId,
        this.count,
        this.review,
        this.userName,
        this.createdAt,
        this.riceType,
        this.reviewId});

  ReviewResponseList.fromJson(Map<String, dynamic> json) {
    riceId = json['riceId'];
    count = json['count'];
    review = json['review'];
    userName = json['userName'];
    createdAt = json['createdAt'];
    riceType = json['riceType'];
    reviewId = json['reviewId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['riceId'] = riceId;
    data['count'] = count;
    data['review'] = review;
    data['userName'] = userName;
    data['createdAt'] = createdAt;
    data['riceType'] = riceType;
    data['reviewId'] = reviewId;
    return data;
  }
}
