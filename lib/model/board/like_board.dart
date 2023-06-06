class LikeBoard {
  int? boardLike;
  bool? liked;

  LikeBoard({this.boardLike, this.liked});

  LikeBoard.fromJson(Map<String, dynamic> json) {
    boardLike = json['boardLike'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['boardLike'] = this.boardLike;
    data['liked'] = this.liked;
    return data;
  }
}