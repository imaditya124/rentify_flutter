import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rentify/models/user.dart';

class ApiService {
  final Dio _dio = Dio();
  final String? _baseUrl = dotenv.env['API_BASE_URL'];

  ApiService() {
    _dio.options.baseUrl = _baseUrl ?? 'http://your-springboot-server:8080';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
    ));
  }

  Future<Map<String, dynamic>> _handleResponse(Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future<String> sendOtp(String email) async {
    try {
      final response = await _dio.post(
        '/api/auth/send-otp',
        data: {'email': email},
      );
      return _handleResponse(response).then((data) => data['message']);
    } on DioException catch (e) {
      throw Exception('Failed to send OTP: ${e.message}');
    }
  }

  Future<User> verifyOtp(String email, String otp) async {
    try {
      final response = await _dio.post(
        '/api/auth/verify-otp',
        data: {'email': email, 'otp': otp},
      );
      return _handleResponse(response).then((data) => User.fromJson(data['user']));
    } on DioException catch (e) {
      throw Exception('Failed to verify OTP: ${e.message}');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      final response = await _dio.post(
        '/api/auth/reset-password',
        data: {'email': email},
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw Exception('Failed to reset password: ${e.message}');
    }
  }

// Add more API methods for properties, chats etc.
}