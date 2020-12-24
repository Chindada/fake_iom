import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'package:fake_iom/global.dart';

Future<LoginResponse> login(String username, String password) async {
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  var url = '$systemUrl/ioms5system/auth/login';
  var pass = generateMd5(password);

  print('$url,$username,$pass');

  final response = await http.get(url, headers: {
    'account': username,
    'password': pass,
  });
  return LoginResponse.fromJson(jsonDecode(response.body));
}

class Resource {
  int id, seq;
  String name;
  // List<int> operation;

  Resource({this.id, this.name, this.seq});
  // Resource({this.id, this.name, this.operation});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['id'],
      name: json['name'],
      seq: json['seq'],
      // operation: json['operation'],
    );
  }
}

class User {
  int id;
  String account;
  bool status;

  User({this.id, this.account, this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      account: json['account'],
      status: json['status'],
    );
  }
}

class LoginResponse {
  final String response, edition;
  final User user;
  final List<Resource> resource;

  LoginResponse({this.response, this.edition, this.resource, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    List tmpResourceList = json['resource'];
    List<Resource> _resource = tmpResourceList
        .map((tmpResourceJson) => Resource.fromJson(tmpResourceJson))
        .toList();

    return LoginResponse(
      response: json['response'],
      edition: json['edition'],
      user: User.fromJson(json['user']),
      resource: _resource,
    );
  }
}
