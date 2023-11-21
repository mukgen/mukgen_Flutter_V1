import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class IdDuplicateCheckResponseDTO extends BaseResponseDTO<bool> {
  late final bool duplicate;

  IdDuplicateCheckResponseDTO();

  factory IdDuplicateCheckResponseDTO.fromJson(Map<String, dynamic> json) =>
      IdDuplicateCheckResponseDTO()..duplicate = json['duplicate'];

  @override
  fromJson(Map<String, dynamic> json) =>
      IdDuplicateCheckResponseDTO.fromJson(json);

  @override
  bool toEntity() => duplicate;
}
