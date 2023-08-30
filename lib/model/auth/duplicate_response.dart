class DuplicateResponse {
  bool? duplicate;

  DuplicateResponse({this.duplicate});

  DuplicateResponse.fromJson(Map<String, dynamic> json) {
    duplicate = json['duplicate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duplicate'] = duplicate;
    return data;
  }
}