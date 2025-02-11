import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonTextField.dart';
import 'package:trucktech_automobiles/utlis/widgets/common_image_picker_model.dart';
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
        buildHeading(heading: 'Date of Inward'),
        SizedBox(height: height * 0.01),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CommonTextField(
            controller: addVehicleProvider.dateOfInwardController,
            labelText: 'Date of Inward',
            hintText: 'Enter your date of Inward...',
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                String formattedDate =
                    "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                addVehicleProvider.dateOfInwardController.text = formattedDate;
              }
            },
          ),
        ),
        SizedBox(height: height * 0.02),

        /// Vehicle No
        buildHeading(heading: 'Vehicle No'),
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
        buildHeading(heading: 'Service Type'),
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
        buildHeading(heading: 'Driver voice'),
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
        buildHeading(heading: 'Mechanics Attending The Vehicle'),
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
        buildHeading(heading: 'Type'),
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
          buildHeading(heading: 'Email Screenshot'),
          SizedBox(height: height * 0.01),
          Consumer<AddVehicleProvider>(
              builder: (context, addVehicleProvider, child) {
            return InkWell(
              onTap: () {
                showImagePickerBottomSheet(
                  context: context,
                  onCameraTap: () => addVehicleProvider
                      .emailScreenShotPictureImagePicker(ImageSource.camera),
                  onGalleryTap: () => addVehicleProvider
                      .emailScreenShotPictureImagePicker(ImageSource.gallery),
                );
              },
              child: Container(
                height: height * 0.25,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColor.subItemColor,
                  ),
                ),
                child: addVehicleProvider.clusterMeterPictureImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          addVehicleProvider.emailScreenShotPictureImage!,
                          width: double.infinity,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Center(
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
              ),
            );
          }),
          SizedBox(height: height * 0.02),
          buildHeading(heading: 'Location'),
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
          buildHeading(heading: 'At-Site'),
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

  /// Widget for Heading
  Widget buildHeading({required String heading}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        heading,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
