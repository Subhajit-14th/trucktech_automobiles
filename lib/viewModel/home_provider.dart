import 'package:flutter/material.dart';
import 'package:trucktech_automobiles/model/dashboard_items_model.dart';

class HomeProvider with ChangeNotifier {
  bool _showMenu = false;

  bool get showMenu => _showMenu;

  bool _isRenderText = false;

  bool get isRenderText => _isRenderText;

  String _selectedMenu = 'Dashboard';

  String get selectedMenu => _selectedMenu;

  final List<DashBoardItemsModel> _dashboardItems = [
    DashBoardItemsModel(
      title: 'Add Total Vehicles',
      icon: Icons.no_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Vehicles Attended Today',
      icon: Icons.no_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Pending Vehicles(Work In Progress)',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Paid Vehicles',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Breakdown Vehicles',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Accidental Vehicles(Inward)',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total At-Site Vehicles',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Paid Billing',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Claim Amount Lodged',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Counter Sale',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
    DashBoardItemsModel(
      title: 'Total Revenue',
      icon: Icons.car_crash,
      itemCount: 0,
    ),
  ];

  List<DashBoardItemsModel> get dashboardItems => _dashboardItems;

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
