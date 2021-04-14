import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
  Future<Map>recuperarPreco(url) async {
    http.Response response = await http.get(url);
    return json.decode( response.body );
  }