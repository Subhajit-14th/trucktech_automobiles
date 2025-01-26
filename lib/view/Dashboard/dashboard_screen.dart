import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/animatedContainerWithRowColumnAnimation.dart';
import 'package:trucktech_automobiles/viewModel/home_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          InkWell(
            onTap: () {},
            child: AnimatedContainerWithRowColumnAnimation(
              icon: Icons.no_crash,
              label: 'Add Vehicles',
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          InkWell(
            onTap: () {},
            child: AnimatedContainerWithRowColumnAnimation(
              icon: Icons.car_crash,
              label: 'No Of Vehicles',
            ),
          ),
        ],
      ),
    );
  }
}
