import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inFluNinja/models/git.dart';

abstract class GithubServiceInteface {
  Future<List<Git>> fetchByUsername(String username);
}

class GithubService implements GithubServiceInteface {
  Future<List<Git>> fetchByUsername(String username) async {
    final response =
        await http.get('https://api.github.com/users/$username/repos');

    if (response.statusCode == 200) {
      dynamic obj = json.decode(response.body);
      return Git.fromJson(obj);
    }

    return null;
  }
}
