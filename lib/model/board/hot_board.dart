class HotBoard {
  List<BoardPopularResponseList>? boardPopularResponseList;

  HotBoard({this.boardPopularResponseList});

  HotBoard.fromJson(Map<String, dynamic> json) {
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