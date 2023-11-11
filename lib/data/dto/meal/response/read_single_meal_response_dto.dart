import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/meal/meal_entity.dart';

final class ReadSingleMealResponseDTO extends BaseResponseDTO<MealEntity> {
  late RiceType riceType;
  late int riceId;
  late List<String> items;

  ReadSingleMealResponseDTO();

  factory ReadSingleMealResponseDTO.fromJson(Map<String, dynamic> json) =>
      ReadSingleMealResponseDTO()
        ..riceType = RiceType.values.byName(json['riceType'])
        ..riceId = json['riceId']
        ..items = json['item'] as List<String>;

  @override
  fromJson(Map<String, dynamic> json) =>
      ReadSingleMealResponseDTO.fromJson(json);

  @override
  MealEntity toEntity() =>
      MealEntity(riceType: riceType, riceId: riceId, items: items);
}
