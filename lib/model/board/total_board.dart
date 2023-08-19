class BoardResponse {
  BoardListResponse? boardListResponse;
  BoardPopularListResponse? boardPopularListResponse;

  BoardResponse({this.boardListResponse, this.boardPopularListResponse});

  BoardResponse.fromJson(Map<String, dynamic> json) {
    boardListResponse = json['boardListResponse'] != null
        ? BoardListResponse.fromJson(json['boardListResponse'])
        : null;
    boardPopularListResponse = json['boardPopularListResponse'] != null
        ? BoardPopularListResponse.fromJson(
        json['boardPopularListResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (boardListResponse != null) {
      data['boardListResponse'] = boardListResponse!.toJson();
    }
    if (boardPopularListResponse != null) {
      data['boardPopularListResponse'] =
          boardPopularListResponse!.toJson();
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
        boardMinimumResponseList!.add(BoardMinimumResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (boardMinimumResponseList != null) {
      data['boardMinimumResponseList'] =
          boardMinimumResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BoardMinimumResponseList {
  int? boardId;
  String? title;
  String? content;
  String? userNickname;
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
        this.userNickname,
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
    userNickname = json['userNickname'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    viewCount = json['viewCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardId'] = boardId;
    data['title'] = title;
    data['content'] = content;
    data['userNickname'] = userNickname;
    data['likeCount'] = likeCount;
    data['commentCount'] = commentCount;
    data['viewCount'] = viewCount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['updated'] = updated;
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
        boardPopularResponseList!.add(BoardPopularResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (boardPopularResponseList != null) {
      data['boardPopularResponseList'] =
          boardPopularResponseList!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardId'] = boardId;
    data['title'] = title;
    data['commentCount'] = commentCount;
    data['viewCount'] = viewCount;
    return data;
  }
}
