import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/viewModel/home_provider.dart';

class AnimatedContainerWithRowColumnAnimation extends StatelessWidget {
  const AnimatedContainerWithRowColumnAnimation(
      {super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.secondaryColor,
          style: BorderStyle.solid,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withAlpha(50), // Adjust opacity as needed
              ),
            ),

            Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: context.watch<HomeProvider>().showMenu
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                            size: 28,
                          ),
                          AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.watch<HomeProvider>().showMenu
                                  ? 16
                                  : 18,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text(
                              label,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 16,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                            size: 28,
                          ),
                          AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.watch<HomeProvider>().showMenu
                                  ? 16
                                  : 18,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text(
                              label,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
