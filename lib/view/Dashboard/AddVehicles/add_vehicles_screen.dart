import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonButton.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonTextField.dart';

class AddVehiclesScreen extends StatefulWidget {
  const AddVehiclesScreen({super.key});

  @override
  State<AddVehiclesScreen> createState() => _AddVehiclesScreenState();
}

class _AddVehiclesScreenState extends State<AddVehiclesScreen> {
  int _currentStep = 0;

  TextEditingController _dateOfInwardController = TextEditingController();
  TextEditingController _vehicleNoController = TextEditingController();
  String? selectdAccident;
  List<String> dropdownValuesOfAccident = [
    'PAID',
    'AMC',
    'EWP',
    'WARRANTY',
    'INSURANCE'
  ];
  TextEditingController _driverVoiceController = TextEditingController();

  final List<String> dropdownMechanicsName = [
    "Mechanic A",
    "Mechanic B",
    "Mechanic C",
    "Mechanic D",
    "Mechanic E",
    "Mechanic F",
  ];
  List<String> _selectedMechanicsNames = [];

  String? _selectedType;
  List<String> dropdownTypes = [
    'WORKSHOP',
    'BREAKDOWN',
    'ACCIDENTAL',
    'AT-SITE'
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                ],
              ),
            ),

            /// Forms
            /// Date of Inward
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Date of Inward',
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
                controller: _dateOfInwardController,
                labelText: 'Date of Inward',
                hintText: 'Enter your date of Inward...',
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Vehicle No
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Vehicle No',
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
                controller: _dateOfInwardController,
                labelText: 'Vehicle No',
                hintText: 'Enter your date of Inward...',
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Accidental No
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Accidental No',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.textColor.withAlpha(100),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  value: selectdAccident,
                  hint: Text(
                    selectdAccident ?? 'Choose one',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  isExpanded: true,
                  items: dropdownValuesOfAccident.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectdAccident = newValue; // Update the selected value
                    });
                    print("Selected: $selectdAccident");
                  },
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Driver Voice
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Driver voice',
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
                controller: _driverVoiceController,
                labelText: 'Driver voice',
                hintText: 'Enter your date of Inward...',
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Mechanics attending the vehicle
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Mechanics Attending The Vehicle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.withAlpha(100),
                ),
              ),
              child: MultiSelectDialogField(
                items: dropdownMechanicsName
                    .map((mechanic) =>
                        MultiSelectItem<String>(mechanic, mechanic))
                    .toList(),
                initialValue: _selectedMechanicsNames,
                title: Text("Select Mechanics"),
                dialogHeight: height * 0.3,
                selectedColor: AppColor.secondaryColor,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.withAlpha(100),
                  ),
                ),
                buttonText: Text(
                  "Choose one or more",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                onConfirm: (results) {
                  setState(() {
                    _selectedMechanicsNames = results.cast<String>();
                  });
                  print("Selected Mechanics: $_selectedMechanicsNames");
                },
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Type
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Type',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.textColor.withAlpha(100),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  value: _selectedType,
                  hint: Text(
                    _selectedType ?? 'Choose one',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  isExpanded: true,
                  items: dropdownTypes.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue; // Update the selected value
                    });
                    print("Selected: $_selectedType");
                  },
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Common button
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: CommonButton(
                width: width / 1,
                height: height * 0.06,
                buttonText: 'Sign in',
                onTap: _currentStep == 1
                    ? () {}
                    : () {
                        setState(() {
                          _currentStep++;
                        });
                      },
              ),
            ),
          ],
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
