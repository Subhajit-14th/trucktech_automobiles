import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/view/Dashboard/dashboard_screen.dart';
import 'package:trucktech_automobiles/viewModel/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.secondaryColor,
              AppColor.itemsColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          children: [
            Consumer<HomeProvider>(builder: (context, value, child) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.symmetric(
                    vertical: value.showMenu
                        ? MediaQuery.of(context).size.height / 11
                        : MediaQuery.of(context).size.height / 12),
                width: value.showMenu ? 210 : 80,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(80),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),

                    /// Icon button
                    InkWell(
                      onTap: () {
                        if (value.showMenu && value.isRenderText) {
                          value.setShowRenderText(
                              isRenderText: !value.isRenderText);
                          value.setShowMenu(showMenu: !value.showMenu);
                        } else {
                          value.setShowMenu(showMenu: !value.showMenu);
                          Future.delayed(Duration(milliseconds: 500), () {
                            value.setShowRenderText(
                                isRenderText: !value.isRenderText);
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 18),
                        child: Icon(
                          value.showMenu
                              ? Icons.arrow_back_ios
                              : Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),

                    /// Home Button
                    menuButtons(icon: Icons.home_outlined, label: 'Home'),
                    SizedBox(height: 20),

                    /// Insurance button
                    menuButtons(
                        icon: Icons.insert_drive_file_outlined,
                        label: 'Employee Data'),
                    SizedBox(height: 20),

                    /// Driver Button
                    menuButtons(
                        icon: Icons.people_alt_outlined,
                        label: 'Attend Vehicle-Entry'),
                    SizedBox(height: 20),

                    /// Vehicles Button
                    menuButtons(
                        icon: Icons.directions_car_outlined,
                        label: 'Work in Progress Vehicles (Pending Vehicles)'),
                    SizedBox(height: 20),

                    /// Credentials Button
                    menuButtons(
                        icon: Icons.file_present,
                        label: 'Report-Workshop Vehicles'),
                    SizedBox(height: 20),

                    /// Authorizations Button
                    menuButtons(
                        icon: Icons.verified_user_outlined,
                        label: 'Report-Accidental Vehicles'),
                    SizedBox(height: 20),

                    /// Issues Button
                    menuButtons(
                        icon: Icons.info_outline_rounded,
                        label: 'Report-At-Site Vehicles'),
                    SizedBox(height: 20),

                    /// Trip requests Button
                    menuButtons(
                        icon: Icons.location_on_outlined,
                        label: 'Report-Breakdown Vehicles'),
                    SizedBox(height: 20),

                    /// Open trips Button
                    menuButtons(icon: Icons.map_outlined, label: 'Master Data'),
                    SizedBox(height: 20),

                    /// Stock Button
                    menuButtons(icon: Icons.inventory, label: 'Stock'),
                    SizedBox(height: 20),
                  ],
                ),
              );
            }),
            SizedBox(width: 16),
            Expanded(
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }

  /// Buttons
  Widget menuButtons({required IconData icon, required String label}) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      bool isSelected = value.selectedMenu == label;
      return InkWell(
        onTap: () {
          value.setSelectedMenu(label);
        },
        child: Container(
          margin: EdgeInsets.only(left: value.showMenu ? 10 : 10, right: 18),
          padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: value.showMenu
                  ? isSelected
                      ? 10
                      : 0
                  : 0),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
              SizedBox(width: value.isRenderText ? 8 : 0),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                curve: Curves.easeInBack,
                opacity: value.isRenderText ? 1.0 : 0.0,
                child: SizedBox(
                  width: value.isRenderText ? 120 : 0,
                  height: 20,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
