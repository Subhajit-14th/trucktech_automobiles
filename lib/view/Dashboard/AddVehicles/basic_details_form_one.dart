import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonTextField.dart';
import 'package:trucktech_automobiles/viewModel/add_vehicle_provider.dart';

class BasicDetailsFromOne extends StatelessWidget {
  const BasicDetailsFromOne({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final addVehicleProvider = Provider.of<AddVehicleProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            controller: addVehicleProvider.dateOfInwardController,
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
            controller: addVehicleProvider.vehicleNoController,
            labelText: 'Vehicle No',
            hintText: 'Enter your date of Inward...',
          ),
        ),
        SizedBox(height: height * 0.02),

        /// Accidental No
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Service Type',
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
              value: addVehicleProvider.selectdServiceType,
              hint: Text(
                addVehicleProvider.selectdServiceType ?? 'Choose one',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              isExpanded: true,
              items: addVehicleProvider.dropdownServiceType.map((String item) {
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
                addVehicleProvider.setServiceType(newValue!);
              },
              // Customizing the selected item display
              selectedItemBuilder: (BuildContext context) {
                return addVehicleProvider.dropdownServiceType
                    .map((String item) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.white, // Selected item text color
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList();
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
            controller: addVehicleProvider.driverVoiceController,
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
            items: addVehicleProvider.dropdownMechanicsName
                .map((mechanic) => MultiSelectItem<String>(mechanic, mechanic))
                .toList(),
            initialValue: addVehicleProvider.selectedMechanicsNames,
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
              addVehicleProvider.setMechanicsName(results);
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
              value: addVehicleProvider.selectedType,
              hint: Text(
                addVehicleProvider.selectedType ?? 'Choose one',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              isExpanded: true,
              items: addVehicleProvider.dropdownType.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.black, // Dropdown items text color
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                addVehicleProvider.setType(newValue!);
              },
              // Customizing the selected item display
              selectedItemBuilder: (BuildContext context) {
                return addVehicleProvider.dropdownType.map((String item) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.white, // Selected item text color
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
        SizedBox(height: height * 0.02),

        /// Location
        if (addVehicleProvider.selectedType == 'BREAKDOWN') ...[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Location',
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
              controller: addVehicleProvider.locationController,
              labelText: 'Enter the location',
              hintText: 'Enter your date of Inward...',
            ),
          ),
          SizedBox(height: height * 0.02),
        ],

        /// AT - SITE
        if (addVehicleProvider.selectedType == 'AT-SITE') ...[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'At-Site',
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
              controller: addVehicleProvider.atSiteLocationController,
              labelText: 'Enter the at site location',
              hintText: 'Enter your date of Inward...',
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ],
    );
  }
}
