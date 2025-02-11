import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonTextField.dart';
import 'package:trucktech_automobiles/utlis/widgets/common_image_picker_model.dart';
import 'package:trucktech_automobiles/viewModel/add_vehicle_provider.dart';

class BasicDetailsFromTwo extends StatelessWidget {
  const BasicDetailsFromTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final addVehicleProvider = Provider.of<AddVehicleProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (context.read<AddVehicleProvider>().selectedType !=
            'ACCIDENTAL') ...[
          /// CLUSTER METER PICTURE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Cluster Meter Picture',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Consumer<AddVehicleProvider>(
              builder: (context, addVehicleProvider, child) {
            return InkWell(
              onTap: () {
                showImagePickerBottomSheet(
                  context: context,
                  onCameraTap: () => addVehicleProvider
                      .clusterMeterPictureImagePicker(ImageSource.camera),
                  onGalleryTap: () => addVehicleProvider
                      .clusterMeterPictureImagePicker(ImageSource.gallery),
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
                          addVehicleProvider.clusterMeterPictureImage!,
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

          /// VEHICLE PICTURE FROM FRONT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Vehicle Picture From Front',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Consumer<AddVehicleProvider>(
              builder: (context, addVehicleProvider, child) {
            return InkWell(
              onTap: () {
                showImagePickerBottomSheet(
                  context: context,
                  onCameraTap: () => addVehicleProvider
                      .vehiclePictureFromFrontImagePicker(ImageSource.camera),
                  onGalleryTap: () => addVehicleProvider
                      .vehiclePictureFromFrontImagePicker(ImageSource.gallery),
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
                child: addVehicleProvider.vehiclePictureFromFront != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          addVehicleProvider.vehiclePictureFromFront!,
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

          /// TRAIL OF VEHICLE (AFTER COMPLETING THE WORK)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Trail Of Vehicle (After Ccompleing the Work)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Consumer<AddVehicleProvider>(
              builder: (context, addVehicleProvider, child) {
            return Container(
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
                  value: addVehicleProvider.selecteddTrailOfVehicle,
                  hint: Text(
                    addVehicleProvider.selecteddTrailOfVehicle ?? 'Choose one',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  isExpanded: true,
                  items: addVehicleProvider.trailOfVehicleValues
                      .map((String item) {
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
                    addVehicleProvider.setTrailOfVehicle(newValue!);
                  },
                  // Customizing the selected item display
                  selectedItemBuilder: (BuildContext context) {
                    return addVehicleProvider.trailOfVehicleValues
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
            );
          }),
          SizedBox(height: height * 0.02),
        ],
        if (context.read<AddVehicleProvider>().selectedType ==
            'ACCIDENTAL') ...[
          /// Heading Accident Details
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Pre Entry',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Policy No
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Policy No',
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
              labelText: 'Policy No',
              hintText: 'Enter your policy no...',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Insured Name/Owner
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Insured Name/Owner',
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
              controller: addVehicleProvider.insuredNameOwnerController,
              labelText: 'Insured Name/Owner',
              hintText: 'Enter your insured name/owner...',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Insurance Policy/Insurers
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Insurance Policy/Insurers',
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
              controller: addVehicleProvider.insurancePolicyInsurersController,
              labelText: 'Insurance Policy/Insurers',
              hintText: 'Enter your insurance policy/insurers...',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Period of Insurance
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Period of Insurance',
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
              controller: addVehicleProvider.periodOfInsuranceController,
              labelText: 'Period of Insurance',
              hintText: 'Enter your period of insurance...',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// IDV Amount
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'IDV Amount',
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
              controller: addVehicleProvider.idvAmountController,
              labelText: 'IDV Amount',
              hintText: 'Enter your IDV amount...',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Chassis No.
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Chassis No.',
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
              controller: addVehicleProvider.chassisNoController,
              labelText: 'Chassis No',
              hintText: 'Enter your chassis no....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Engine No.
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Engine No.',
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
              controller: addVehicleProvider.engineNoController,
              labelText: 'Engine No',
              hintText: 'Enter your engine no....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Make / Variant/ Model /Color
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Make / Variant/ Model /Color',
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
              controller: addVehicleProvider.makeVariantModelColorController,
              labelText: 'Make / Variant/ Model /Color',
              hintText: 'Enter your Make / Variant/ Model /Color....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Weather Vehicle is National Permit?
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Weather Vehicle is National Permit?',
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
              controller:
                  addVehicleProvider.weatherVehicleisNationalPermitController,
              labelText: 'Weather Vehicle is National Permit',
              hintText: 'Enter your Weather Vehicle is National Permit....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Whether Vehicle No., Engine No. and Chassis No. correct and mentioned in Policy
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Whether Vehicle No., Engine No. and Chassis No. correct and mentioned in Policy',
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
                value: addVehicleProvider
                    .selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy,
                hint: Text(
                  addVehicleProvider
                          .selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy ??
                      'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider
                    .whetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue
                    .map((String item) {
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
                  addVehicleProvider
                      .setWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue(
                          newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider
                      .whetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue
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

          if (addVehicleProvider
                  .selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy ==
              'No') ...[
            /// HighLight
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'HighLight',
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
                controller: addVehicleProvider.makeVariantModelColorController,
                labelText: 'HighLight',
                hintText: 'Enter your HighLight....',
              ),
            ),
            SizedBox(height: height * 0.02),
          ],

          /// Accident Date
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Accident Date',
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
              controller: addVehicleProvider.accidentDateController,
              labelText: 'Accident Date',
              hintText: 'Enter your accident date....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Accident Time
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Accident Time',
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
              controller: addVehicleProvider.accidentTimeController,
              labelText: 'Accident Time',
              hintText: 'Enter your accident time....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Accident Location
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Accident Location',
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
              controller: addVehicleProvider.accidentTimeController,
              labelText: 'Accident Location',
              hintText: 'Enter your accident location....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Cause of Loss
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Cause of Loss',
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
              controller: addVehicleProvider.causeOfLossController,
              labelText: 'Cause of Loss',
              hintText: 'Enter your cause of loss....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Reason of Accident/ cause of loss
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Reason of Accident/ cause of loss',
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
              controller: addVehicleProvider.reasonOfAccidentCauseOfLoss,
              labelText: 'Reason of Accident/ cause of loss',
              hintText: 'Enter your reason of accident/ cause of loss....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// VEHICLE CAME TO WORKSHOP BY CRANE
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Vehicle came to Workshop By Crane',
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
                value: addVehicleProvider.selectedVehicleCameToWorkShopByCrane,
                hint: Text(
                  addVehicleProvider.selectedVehicleCameToWorkShopByCrane ??
                      'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider.vehicleCameToWorkShopByCraneValue
                    .map((String item) {
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
                  addVehicleProvider
                      .setSelectedVehicleCameToWorkShopByCrane(newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider.vehicleCameToWorkShopByCraneValue
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

          if (addVehicleProvider.selectedVehicleCameToWorkShopByCrane ==
              "Yes") ...[
            /// Crane Bill Picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Crane Bill',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Consumer<AddVehicleProvider>(
                builder: (context, addVehicleProvider, child) {
              return InkWell(
                onTap: () {
                  showImagePickerBottomSheet(
                    context: context,
                    onCameraTap: () => addVehicleProvider
                        .craneBillPostAccidentPictureImagePicker(
                            ImageSource.camera),
                    onGalleryTap: () => addVehicleProvider
                        .craneBillPostAccidentPictureImagePicker(
                            ImageSource.gallery),
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
                  child: addVehicleProvider.craneBillPostAccidentPicture != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            addVehicleProvider.craneBillPostAccidentPicture!,
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
          ],

          /// Driver Name
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Driver Name',
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
              controller: addVehicleProvider.driverNameController,
              labelText: 'Driver Name',
              hintText: 'Enter your driver name....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// License No
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'License No',
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
              controller: addVehicleProvider.licenseNoController,
              labelText: 'License No',
              hintText: 'Enter your license no....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Driver License Issuing Authority
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Driver License Issuing Authority',
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
              controller:
                  addVehicleProvider.driverLicenseIssuingAuthorityController,
              labelText: 'Driver License Issuing Authority',
              hintText: 'Enter your driver license issuing authority....',
            ),
          ),
          SizedBox(height: height * 0.02),

          /// Any injury to driver or conductor
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Any injury to driver or conductor',
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
                value: addVehicleProvider.selectedInjusryDriverValue,
                hint: Text(
                  addVehicleProvider.selectedInjusryDriverValue ?? 'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider.injusryDriverValue.map((String item) {
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
                  addVehicleProvider.setInjusryDriverValue(newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider.injusryDriverValue
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

          if (addVehicleProvider.selectedInjusryDriverValue == "Yes") ...[
            /// Injury Picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Injury Picture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Consumer<AddVehicleProvider>(
                builder: (context, addVehicleProvider, child) {
              return InkWell(
                onTap: () {
                  showImagePickerBottomSheet(
                    context: context,
                    onCameraTap: () => addVehicleProvider
                        .injusryDriverPictureImagePicker(ImageSource.camera),
                    onGalleryTap: () => addVehicleProvider
                        .injusryDriverPictureImagePicker(ImageSource.gallery),
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
                  child: addVehicleProvider.injusryDriverPicture != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            addVehicleProvider.injusryDriverPicture!,
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
          ],

          /// Loaded or not
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Loaded or not',
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
                value: addVehicleProvider.selectedLoadedOrNotValue,
                hint: Text(
                  addVehicleProvider.selectedLoadedOrNotValue ?? 'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider.loadedOrNotValue.map((String item) {
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
                  addVehicleProvider.setLoadedOrNotValue(newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider.loadedOrNotValue.map((String item) {
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

          if (addVehicleProvider.selectedLoadedOrNotValue == "Yes") ...[
            /// Load Documents
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Load Documents',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Consumer<AddVehicleProvider>(
                builder: (context, addVehicleProvider, child) {
              return InkWell(
                onTap: () {
                  showImagePickerBottomSheet(
                    context: context,
                    onCameraTap: () => addVehicleProvider
                        .loadedDocumentsPictureImagePicker(ImageSource.camera),
                    onGalleryTap: () => addVehicleProvider
                        .loadedDocumentsPictureImagePicker(ImageSource.gallery),
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
                  child: addVehicleProvider.injusryDriverPicture != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            addVehicleProvider.loadedDocumentsPicture!,
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
          ],

          /// Police Action
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Police Action',
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
                value: addVehicleProvider.selectedPoliceActionValue,
                hint: Text(
                  addVehicleProvider.selectedPoliceActionValue ?? 'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider.policeActionValueValue
                    .map((String item) {
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
                  addVehicleProvider.setPoliceActionValue(newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider.policeActionValueValue
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

          if (addVehicleProvider.selectedPoliceActionValue == "Yes") ...[
            /// Police Action Documents
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Police Action Documents',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Consumer<AddVehicleProvider>(
                builder: (context, addVehicleProvider, child) {
              return InkWell(
                onTap: () {
                  showImagePickerBottomSheet(
                    context: context,
                    onCameraTap: () => addVehicleProvider
                        .policeActionPicturePictureImagePicker(
                            ImageSource.camera),
                    onGalleryTap: () => addVehicleProvider
                        .policeActionPicturePictureImagePicker(
                            ImageSource.gallery),
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
                  child: addVehicleProvider.injusryDriverPicture != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            addVehicleProvider.policeActionPicture!,
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
          ],

          /// Third party Loss/ Injuries
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Third party Loss/ Injuries',
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
                value: addVehicleProvider.selectedThirdPartyLossInjuriesValue,
                hint: Text(
                  addVehicleProvider.selectedThirdPartyLossInjuriesValue ??
                      'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider.thirdPartyLossInjuriesValue
                    .map((String item) {
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
                  addVehicleProvider.setThirdPartyLossinjuriesValue(newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider.thirdPartyLossInjuriesValue
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
        ],
      ],
    );
  }
}
