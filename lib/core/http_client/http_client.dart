import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomHttpClient {
  final String baseUrl;
  final http.Client _client;

  CustomHttpClient({required this.baseUrl}) : _client = http.Client();

  Future<dynamic> get(String endpoint) async {
    final response = await _client.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );

    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    final response = await _client.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? body}) async {
    final response = await _client.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    final response = await _client.delete(Uri.parse('$baseUrl$endpoint'));

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
      case 404:
      case 500:
        throw Exception('Error: ${response.statusCode} - ${response.body}');
      default:
        throw Exception('Unexpected error: ${response.statusCode}');
    }
  }

  void close() {
    _client.close();
  }
}
