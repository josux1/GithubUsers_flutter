// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:github_browse/models/user.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  var baseUrl = 'https://api.github.com/search/users?q=';

  Future<List<Item>> getUsers(String query) async {
    final response = await http.get(Uri.parse(baseUrl + query));

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print(responseJson);

      return (responseJson['items'] as List)
          .map((p) => Item.fromMap(p))
          .toList();
    } else {
      throw Exception('Failed to load Users');
    }
  }
}
