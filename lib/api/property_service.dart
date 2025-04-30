import 'package:dio/dio.dart';
import 'package:rentify/models/property.dart';

class PropertyService {
  final Dio _dio;

  PropertyService(this._dio);

  Future<List<Property>> getProperties() async {
    try {
      final response = await _dio.get('/api/properties');
      return (response.data as List)
          .map((json) => Property.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to load properties: ${e.message}');
    }
  }

  Future<Property> createProperty(Property property) async {
    try {
      final response = await _dio.post(
        '/api/properties',
        data: property.toJson(),
      );
      return Property.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to create property: ${e.message}');
    }
  }

// Add more methods for update, delete, etc.
}