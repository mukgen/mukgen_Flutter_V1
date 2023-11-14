import 'package:mukgen_flutter_v1/core/network/base_network_dto.dart';

final class ReadSingleMealRequestDTO extends BaseRequestDTO {
  final RiceType riceType;
  final String year, month, day;

  ReadSingleMealRequestDTO({
    required this.riceType,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  Map<String, dynamic> toJson() => {
        'riceType': riceType.name.toUpperCase(),
        'year': year,
        'month': month,
        'day': day,
      };
}

enum RiceType { breakfast, lunch, dinner, none }
