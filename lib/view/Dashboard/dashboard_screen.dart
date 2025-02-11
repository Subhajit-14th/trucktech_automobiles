import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/widgets/animatedContainerWithRowColumnAnimation.dart';
import 'package:trucktech_automobiles/utlis/widgets/downToUpPageRoute.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/add_vehicles_screen.dart';
import 'package:trucktech_automobiles/viewModel/home_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 50, bottom: 50),
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade100,
              Colors.transparent,
              Colors.transparent,
              Colors.purple
            ],
            stops: [0.0, 0.1, 0.9, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.builder(
          itemCount: context.read<HomeProvider>().dashboardItems.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    DownToUpPageRoute(widget: AddVehiclesScreen()),
                  );
                }
              },
              child: AnimatedContainerWithRowColumnAnimation(
                icon: context.read<HomeProvider>().dashboardItems[index].icon,
                label: context.read<HomeProvider>().dashboardItems[index].title,
                itemCount: context
                    .read<HomeProvider>()
                    .dashboardItems[index]
                    .itemCount,
              ),
            );
          },
        ),
      ),
    );
  }
}
