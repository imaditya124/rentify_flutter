import 'package:flutter/foundation.dart';
import 'package:rentify/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loginWithEmail(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement API call to send OTP
      await Future.delayed(const Duration(seconds: 2)); // Simulate network call

      // On success
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement API call to verify OTP
      await Future.delayed(const Duration(seconds: 2)); // Simulate network call

      // On success
      _user = User(
        id: '1',
        name: 'Test User',
        email: email,
        phone: '9876543210',
        role: 'TENANT',
      );
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Implement API call to reset password
      await Future.delayed(const Duration(seconds: 2)); // Simulate network call

      // On success
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }
}