import 'package:demo_rest_api/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'api_urls.dart';



class ApiServices {
  Future<List<User>> fetchUser() {
    return http
        .get(ApiUrls().apiUserData)
        .then((http.Response response) {
       final String jsonBody = response.body;
       final int statusCode = response.statusCode;

       if(statusCode!=200 || jsonBody==null) {
         print(response.reasonPhrase);
         throw Exception('Loi load api');
       }

       final json.JsonDecoder _decoder = json.JsonDecoder();
       final userListContainer = _decoder.convert(jsonBody);
       final List userList = userListContainer['results'];
       return userList.map((e) => User.fromJson(e)).toList();
    });
  }
}