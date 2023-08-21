class ProfileUpload {
  String? images;

  ProfileUpload({this.images});

  ProfileUpload.fromJson(Map<String, dynamic> json) {
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['images'] = images;
    return data;
  }
}
