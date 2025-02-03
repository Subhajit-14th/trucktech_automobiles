import 'package:flutter/material.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonButton.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/basic_details_form_one.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/basic_details_form_three.dart';
import 'package:trucktech_automobiles/view/Dashboard/AddVehicles/basic_details_form_two.dart';

class AddVehiclesScreen extends StatefulWidget {
  const AddVehiclesScreen({super.key});

  @override
  State<AddVehiclesScreen> createState() => _AddVehiclesScreenState();
}

class _AddVehiclesScreenState extends State<AddVehiclesScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.itemsColor,
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              /// Custom Stepper Row
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildStepCircle(0),
                    _buildStepDivider(),
                    _buildStepCircle(1),
                    _buildStepDivider(),
                    _buildStepCircle(2),
                  ],
                ),
              ),

              /// Froms
              _currentStep == 0
                  ? BasicDetailsFromOne()
                  : _currentStep == 1
                      ? BasicDetailsFromTwo()
                      : BasicDetailsFormThree(),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(
          color: AppColor.subItemColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CommonButton(
          width: width / 1,
          height: height * 0.06,
          buttonText: _currentStep == 2 ? 'Submit' : 'Next',
          onTap: _currentStep == 2
              ? () {}
              : () {
                  setState(() {
                    _currentStep++;
                  });
                },
        ),
      ),
    );
  }

  Widget _buildStepCircle(int stepIndex) {
    bool isActive = stepIndex < _currentStep;
    bool isCurrent = stepIndex == _currentStep;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: isActive ? AppColor.primaryColor : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isCurrent || isActive ? AppColor.primaryColor : Colors.grey,
                width: 2,
              ),
            ),
            child: Center(
                child: isActive
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                    : Icon(
                        Icons.fiber_manual_record,
                        color: AppColor.primaryColor,
                        size: 14,
                      )),
          ),
        ],
      ),
    );
  }

  // Function to build a divider between steps
  Widget _buildStepDivider() {
    return Expanded(
      child: Divider(
        thickness: 2,
        color: AppColor.primaryColor,
      ),
    );
  }
}
