import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/AtSiteWork/at_site_work_field_screen.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/BreakDown/breakdown_field_screen.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/WorkShop/workshop_field_screen.dart';
import 'package:trucktech_automobiles/viewModel/add_vehicle_provider.dart';

class BasicDetailsFormThree extends StatelessWidget {
  const BasicDetailsFormThree({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Heading text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${context.read<AddVehicleProvider>().selectedType}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: height * 0.01),

        context.read<AddVehicleProvider>().selectedType == "WORKSHOP"
            ? WorkshopFieldScreen()
            : context.read<AddVehicleProvider>().selectedType == "BREAKDOWN"
                ? BreakdownFieldScreen()
                : context.read<AddVehicleProvider>().selectedType == "AT-SITE"
                    ? AtSiteWorkFieldScreen()
                    : Container(),
      ],
    );
  }
}
