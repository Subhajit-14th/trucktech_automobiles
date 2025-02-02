import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/common_image_picker_model.dart';
import 'package:trucktech_automobiles/viewModel/add_vehicle_provider.dart';

class BasicDetailsFromTwo extends StatelessWidget {
  const BasicDetailsFromTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                items:
                    addVehicleProvider.trailOfVehicleValues.map((String item) {
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
    );
  }
}
