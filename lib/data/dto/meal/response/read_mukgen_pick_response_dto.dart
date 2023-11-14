import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/mukgen_pick_entity.dart';

final class ReadMukgenPickResponseDTO
    extends BaseResponseDTO<MukgenPickEntity> {
  late RiceType riceType;
  late int riceId, month, day;

  ReadMukgenPickResponseDTO();

  factory ReadMukgenPickResponseDTO.fromJson(Map<String, dynamic> json) =>
      ReadMukgenPickResponseDTO()
        ..riceType = RiceType.values.byName(json['riceType'])
        ..riceId = json['riceId']
        ..month = json['month']
        ..day = json['day'];

  @override
  fromJson(Map<String, dynamic> json) =>
      ReadMukgenPickResponseDTO.fromJson(json);

  @override
  MukgenPickEntity toEntity() => MukgenPickEntity(
      riceType: riceType, riceId: riceId, month: month, day: day);
}
