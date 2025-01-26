import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _showMenu = false;

  bool get showMenu => _showMenu;

  bool _isRenderText = false;

  bool get isRenderText => _isRenderText;

  String _selectedMenu = 'Dashboard';

  String get selectedMenu => _selectedMenu;

  /// set show menu
  void setShowMenu({required bool showMenu}) {
    _showMenu = showMenu;
    notifyListeners();
  }

  /// set show render text
  void setShowRenderText({required bool isRenderText}) {
    _isRenderText = isRenderText;
    notifyListeners();
  }

  /// set select menu
  void setSelectedMenu(String menu) {
    _selectedMenu = menu;
    notifyListeners();
  }
}