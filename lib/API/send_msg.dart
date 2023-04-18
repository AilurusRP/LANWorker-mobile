import 'dart:convert';

import 'package:http/http.dart' as http;

sendMsg(String ip, String msg) async {
  final response = await http.post(Uri.parse('http://$ip:7684/mobile-msg'),
      body: utf8.encode(json.encode({"msg": msg})));
  if (response.statusCode != 200) {
    throw "Request failed with code ${response.statusCode}";
  }
}
