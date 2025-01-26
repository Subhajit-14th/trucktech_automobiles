
import 'package:flutter/material.dart';

import '../services/depency_services.dart';
import '../utlis/assets/app_string.dart';

class AuthProvider with ChangeNotifier {
  final commonString = getIt<AppString>();

  late final String _baseUrl;

  AuthProvider() {
    _baseUrl = commonString.baseUrl;
  }

  int _tabIndex = 0;

  bool _isAuthenticated = false;

  int get tabIndex => _tabIndex;
  bool get isAuthenticated => _isAuthenticated;

  /// set tab index
  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  /// For login
  Future<void> login({required String email,required String password}) async {
    _isAuthenticated = true;
    Future.delayed(const Duration(seconds: 2), () {
      _isAuthenticated = false;
      notifyListeners();
    });
    notifyListeners();
  }
}
