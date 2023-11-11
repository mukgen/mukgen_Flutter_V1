import 'package:mukgen_flutter_v1/data/dto/meal/request/read_single_meal_request_dto.dart';

class MukgenPickEntity {
  final RiceType riceType;
  final int riceId, month, day;

  MukgenPickEntity({
    required this.riceType,
    required this.riceId,
    required this.month,
    required this.day,
  });
}
