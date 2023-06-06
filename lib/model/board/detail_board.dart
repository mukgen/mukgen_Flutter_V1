class DetailBoard {
  String? title;
  String? content;
  String? userName;
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
        this.userName,
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
    userName = json['userName'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    if (json['likeResponseList'] != null) {
      likeResponseList = <LikeResponseList>[];
      json['likeResponseList'].forEach((v) {
        likeResponseList!.add(new LikeResponseList.fromJson(v));
      });
    }
    if (json['boardCommentList'] != null) {
      boardCommentList = <BoardCommentList>[];
      json['boardCommentList'].forEach((v) {
        boardCommentList!.add(new BoardCommentList.fromJson(v));
      });
    }
    viewCount = json['viewCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['userName'] = this.userName;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    if (this.likeResponseList != null) {
      data['likeResponseList'] =
          this.likeResponseList!.map((v) => v.toJson()).toList();
    }
    if (this.boardCommentList != null) {
      data['boardCommentList'] =
          this.boardCommentList!.map((v) => v.toJson()).toList();
    }
    data['viewCount'] = this.viewCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['liked'] = this.liked;
    return data;
  }
}

class LikeResponseList {
  String? userName;

  LikeResponseList({this.userName});

  LikeResponseList.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['writer'] = this.writer;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['boardCommentId'] = this.boardCommentId;
    return data;
  }
}
