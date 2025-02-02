import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonTextField.dart';
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

        /// Job card no
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Job Card No',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CommonTextField(
            controller: context.read<AddVehicleProvider>().jobCardNoController,
            labelText: 'Job Card No',
            hintText: 'Enter your jpb card no...',
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
