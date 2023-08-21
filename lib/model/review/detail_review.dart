class DetailReview {
  int? count;
  String? userNickname;
  String? content;
  String? createdAt;
  List<ReviewCommentResponseList>? reviewCommentResponseList;

  DetailReview(
      {this.count,
        this.userNickname,
        this.content,
        this.createdAt,
        this.reviewCommentResponseList});

  DetailReview.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    userNickname = json['userNickname'];
    content = json['content'];
    createdAt = json['createdAt'];
    if (json['reviewCommentResponseList'] != null) {
      reviewCommentResponseList = <ReviewCommentResponseList>[];
      json['reviewCommentResponseList'].forEach((v) {
        reviewCommentResponseList!
            .add(ReviewCommentResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['userNickname'] = userNickname;
    data['content'] = content;
    data['createdAt'] = createdAt;
    if (reviewCommentResponseList != null) {
      data['reviewCommentResponseList'] =
          reviewCommentResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewCommentResponseList {
  int? reviewCommentId;
  String? content;
  String? createdAt;
  String? updatedAt;

  ReviewCommentResponseList(
      {this.reviewCommentId, this.content, this.createdAt, this.updatedAt});

  ReviewCommentResponseList.fromJson(Map<String, dynamic> json) {
    reviewCommentId = json['reviewCommentId'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reviewCommentId'] = reviewCommentId;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
