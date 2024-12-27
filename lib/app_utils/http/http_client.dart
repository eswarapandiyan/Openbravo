import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../app_config/app_end_points.dart';

class WHttpHelper {
  static const String _baseUrl = EndPoints.baseApi;

  // Helper method to make a GET request
  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  Future<dynamic> post(String endpoint, dynamic data,
      {Map<String, String>? customHeaders}) async {
    // Default headers
    final headers = {
      'Content-Type': 'application/json',
    };

    // Add custom headers if provided
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    /// API CALLS
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: json.encode(data),
      headers: headers,
      encoding: Encoding.getByName('utf-8'),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<dynamic> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return ('Failed to load data: ${response.statusCode}');
    }
  }
}
