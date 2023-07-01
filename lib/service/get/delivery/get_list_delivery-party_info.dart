import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mukgen_flutter_v1/model/delivery/list_delivery-party.dart';
import 'package:mukgen_flutter_v1/secret.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<ListDeliveryParty> getListDeliveryPartyInfo() async {
  const storage = FlutterSecureStorage();
  dynamic accessToken = await storage.read(key: 'accessToken');
  final response = await http.get(
    Uri.parse("$baseUrl/delivery-party/list"),
    headers: <String, String>{"Authorization": "Bearer $accessToken"},
  );
  if (response.statusCode == 200) {
    return ListDeliveryParty.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw Exception(response.body);
  }
}