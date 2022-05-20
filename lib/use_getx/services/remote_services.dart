import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import '../../models/user_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<User>> fetchUser() async {
    var response = await client.get(Uri.parse('https://api.randomuser.me/?results=10'));
    if(response.statusCode != 200) {
      print(response.reasonPhrase);
      throw Exception('Loi load api');
    }
    const json.JsonDecoder decoder = json.JsonDecoder();
    final userListContainer = decoder.convert(response.body);
    final List userList = userListContainer['results'];
    return userList.map((e) => User.fromJson(e)).toList();
  }
}