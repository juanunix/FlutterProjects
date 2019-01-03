import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://reqres.in";

class API {
  static Future getUsers() {
    var url = baseUrl + "/api/users";
    return http.get(url);
  }
}