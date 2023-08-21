class LikeBoard {
  int? boardLike;
  bool? liked;

  LikeBoard({this.boardLike, this.liked});

  LikeBoard.fromJson(Map<String, dynamic> json) {
    boardLike = json['boardLike'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardLike'] = boardLike;
    data['liked'] = liked;
    return data;
  }
}