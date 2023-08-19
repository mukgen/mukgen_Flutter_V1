class DetailBoard {
  String? title;
  String? content;
  String? userNickname;
  int? likeCount;
  int? commentCount;
  List<LikeResponseList>? likeResponseList;
  List<BoardCommentList>? boardCommentList;
  int? viewCount;
  String? createdAt;
  String? updatedAt;
  bool? liked;

  DetailBoard(
      {this.title,
        this.content,
        this.userNickname,
        this.likeCount,
        this.commentCount,
        this.likeResponseList,
        this.boardCommentList,
        this.viewCount,
        this.createdAt,
        this.updatedAt,
        this.liked});

  DetailBoard.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    userNickname = json['userNickname'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    if (json['likeResponseList'] != null) {
      likeResponseList = <LikeResponseList>[];
      json['likeResponseList'].forEach((v) {
        likeResponseList!.add(LikeResponseList.fromJson(v));
      });
    }
    if (json['boardCommentList'] != null) {
      boardCommentList = <BoardCommentList>[];
      json['boardCommentList'].forEach((v) {
        boardCommentList!.add(BoardCommentList.fromJson(v));
      });
    }
    viewCount = json['viewCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['userNickname'] = userNickname;
    data['likeCount'] = likeCount;
    data['commentCount'] = commentCount;
    if (likeResponseList != null) {
      data['likeResponseList'] =
          likeResponseList!.map((v) => v.toJson()).toList();
    }
    if (boardCommentList != null) {
      data['boardCommentList'] =
          boardCommentList!.map((v) => v.toJson()).toList();
    }
    data['viewCount'] = viewCount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['liked'] = liked;
    return data;
  }
}

class LikeResponseList {
  String? userNickname;

  LikeResponseList({this.userNickname});

  LikeResponseList.fromJson(Map<String, dynamic> json) {
    userNickname = json['userNickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userNickname'] = userNickname;
    return data;
  }
}

class BoardCommentList {
  String? writer;
  String? content;
  String? createdAt;
  int? boardCommentId;

  BoardCommentList(
      {this.writer, this.content, this.createdAt, this.boardCommentId});

  BoardCommentList.fromJson(Map<String, dynamic> json) {
    writer = json['writer'];
    content = json['content'];
    createdAt = json['createdAt'];
    boardCommentId = json['boardCommentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['writer'] = writer;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['boardCommentId'] = boardCommentId;
    return data;
  }
}
