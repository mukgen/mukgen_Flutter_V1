abstract base class BaseRequestDTO {
  Map<String, dynamic> toJson();
}

abstract base class BaseResponseDTO<E> {
  fromJson(Map<String, dynamic> json);

  E toEntity();
}
