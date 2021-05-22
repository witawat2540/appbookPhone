import 'dart:io';

import 'package:http/http.dart' as http;

class Connect {
  String url = "http://172.17.17.195:3000/";
  var header = {HttpHeaders.contentTypeHeader: "application/json"};

  Future<http.Response> post(path, data) async {
    return http.post(Uri.parse(url + path), headers: header, body: data);
  }

  Future<http.Response> get(path) async {
    return http.get(Uri.parse(url + path), headers: header);
  }

  Future<http.Response> delete(path) async {
    return http.delete(Uri.parse(url + path), headers: header);
  }

  Future<http.Response> put(path, data) async {
    return http.put(Uri.parse(url + path), headers: header, body: data);
  }
}
