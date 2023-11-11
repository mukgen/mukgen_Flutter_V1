import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';

class MealEntity {
  final RiceType riceType;
  final int riceId;
  final List<String> items;

  MealEntity({
    required this.riceType,
    required this.riceId,
    required this.items,
  });
}
