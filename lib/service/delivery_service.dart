import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mukgen_flutter_v1/model/delivery/list_delivery-party.dart';
import 'package:mukgen_flutter_v1/secret.dart';

class DeliveryService {
  static const _storage = FlutterSecureStorage();
  static const _url = "$baseUrl/delivery-party/";

  DeliveryService._();

  static Future<ListDeliveryParty> getListDeliveryPartyInfo() async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse("$_url/list"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return ListDeliveryParty.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }

  static Future<int> postDeliveryPartyInfo(
      String menu, int participantNumber, String place, String meetTime) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    Map<String, dynamic> data = {
      "menu": menu,
      "participantNumber": participantNumber,
      "place": place,
      "meetTime": meetTime,
    };
    final response = await http.post(Uri.parse(_url),
        headers: <String, String>{
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json",
          "X-Not-Using-Xquare-Auth": "true",
        },
        body: jsonEncode(data));
    if (response.statusCode != 201) {
      return 0;
    }
    debugPrint(utf8.decode(response.bodyBytes));
    return 1;
  }

  static Future<int> postJoinDeliveryPartyInfo(int deliveryId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.post(
      Uri.parse("$_url/join/$deliveryId"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      return 0;
    }
    debugPrint(utf8.decode(response.bodyBytes));
    return 1;
  }

  static Future<int> postLeaveDeliveryPartyInfo(int deliveryId) async {
    dynamic accessToken = await _storage.read(key: 'accessToken');
    final response = await http.post(
      Uri.parse("$_url/leave/$deliveryId"),
      headers: <String, String>{
        "Authorization": "Bearer $accessToken",
        "X-Not-Using-Xquare-Auth": "true",
      },
    );
    if (response.statusCode != 200) {
      return 0;
    }
    debugPrint(utf8.decode(response.bodyBytes));
    return 1;
  }
}
