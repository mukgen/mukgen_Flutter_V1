class BoardResponse {
  BoardListResponse? boardListResponse;
  BoardPopularListResponse? boardPopularListResponse;

  BoardResponse({this.boardListResponse, this.boardPopularListResponse});

  BoardResponse.fromJson(Map<String, dynamic> json) {
    boardListResponse = json['boardListResponse'] != null
        ? new BoardListResponse.fromJson(json['boardListResponse'])
        : null;
    boardPopularListResponse = json['boardPopularListResponse'] != null
        ? new BoardPopularListResponse.fromJson(
        json['boardPopularListResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.boardListResponse != null) {
      data['boardListResponse'] = this.boardListResponse!.toJson();
    }
    if (this.boardPopularListResponse != null) {
      data['boardPopularListResponse'] =
          this.boardPopularListResponse!.toJson();
    }
    return data;
  }
}

class BoardListResponse {
  List<BoardMinimumResponseList>? boardMinimumResponseList;

  BoardListResponse({this.boardMinimumResponseList});

  BoardListResponse.fromJson(Map<String, dynamic> json) {
    if (json['boardMinimumResponseList'] != null) {
      boardMinimumResponseList = <BoardMinimumResponseList>[];
      json['boardMinimumResponseList'].forEach((v) {
        boardMinimumResponseList!.add(new BoardMinimumResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.boardMinimumResponseList != null) {
      data['boardMinimumResponseList'] =
          this.boardMinimumResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BoardMinimumResponseList {
  int? boardId;
  String? title;
  String? content;
  String? userName;
  int? likeCount;
  int? commentCount;
  int? viewCount;
  String? createdAt;
  String? updatedAt;
  bool? updated;

  BoardMinimumResponseList(
      {this.boardId,
        this.title,
        this.content,
        this.userName,
        this.likeCount,
        this.commentCount,
        this.viewCount,
        this.createdAt,
        this.updatedAt,
        this.updated});

  BoardMinimumResponseList.fromJson(Map<String, dynamic> json) {
    boardId = json['boardId'];
    title = json['title'];
    content = json['content'];
    userName = json['userName'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    viewCount = json['viewCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boardId'] = this.boardId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['userName'] = this.userName;
    data['likeCount'] = this.likeCount;
    data['commentCount'] = this.commentCount;
    data['viewCount'] = this.viewCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['updated'] = this.updated;
    return data;
  }
}

class BoardPopularListResponse {
  List<BoardPopularResponseList>? boardPopularResponseList;

  BoardPopularListResponse({this.boardPopularResponseList});

  BoardPopularListResponse.fromJson(Map<String, dynamic> json) {
    if (json['boardPopularResponseList'] != null) {
      boardPopularResponseList = <BoardPopularResponseList>[];
      json['boardPopularResponseList'].forEach((v) {
        boardPopularResponseList!.add(new BoardPopularResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.boardPopularResponseList != null) {
      data['boardPopularResponseList'] =
          this.boardPopularResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BoardPopularResponseList {
  int? boardId;
  String? title;
  int? commentCount;
  int? viewCount;

  BoardPopularResponseList(
      {this.boardId, this.title, this.commentCount, this.viewCount});

  BoardPopularResponseList.fromJson(Map<String, dynamic> json) {
    boardId = json['boardId'];
    title = json['title'];
    commentCount = json['commentCount'];
    viewCount = json['viewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boardId'] = this.boardId;
    data['title'] = this.title;
    data['commentCount'] = this.commentCount;
    data['viewCount'] = this.viewCount;
    return data;
  }
}
