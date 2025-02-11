import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/common_image_picker_model.dart';
import 'package:trucktech_automobiles/viewModel/add_vehicle_provider.dart';

class AccidentalScreen extends StatelessWidget {
  const AccidentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Registration Certificate Picture
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Resgistration Certicate Picture',
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
                    .registrationCertificatePictureImagePicker(
                        ImageSource.camera),
                onGalleryTap: () => addVehicleProvider
                    .registrationCertificatePictureImagePicker(
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
              child: addVehicleProvider.registrationCertificatePicture != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.file(
                        addVehicleProvider.registrationCertificatePicture!,
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

        /// Registration Certificate Online Verified Copy
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Registration Certificate Online Verified Copy',
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
                    .registrationCertificateOnlineVerifiedCopyPictureImagePicker(
                        ImageSource.camera),
                onGalleryTap: () => addVehicleProvider
                    .registrationCertificateOnlineVerifiedCopyPictureImagePicker(
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
              child: addVehicleProvider
                          .registrationCertificateOnlineVerifiedCopyPicture !=
                      null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.file(
                        addVehicleProvider
                            .registrationCertificateOnlineVerifiedCopyPicture!,
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

        /// Insurance Policy
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Insurance Policy',
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
                    .insurancePolicyPictureImagePicker(ImageSource.camera),
                onGalleryTap: () => addVehicleProvider
                    .insurancePolicyPictureImagePicker(ImageSource.gallery),
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
              child: addVehicleProvider.insurancePolicyPicture != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.file(
                        addVehicleProvider.insurancePolicyPicture!,
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

        /// Driving License
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Driving License',
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
                    .drivingLicensePictureImagePicker(ImageSource.camera),
                onGalleryTap: () => addVehicleProvider
                    .drivingLicensePictureImagePicker(ImageSource.gallery),
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
              child: addVehicleProvider.drivingLicensePicture != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.file(
                        addVehicleProvider.drivingLicensePicture!,
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

        /// Driving License Online Verified Copy
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Driving License Online Verified Copy',
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
                    .drivingLicenseOnlineVerifiedCopyPictureImagePicker(
                        ImageSource.camera),
                onGalleryTap: () => addVehicleProvider
                    .drivingLicenseOnlineVerifiedCopyPictureImagePicker(
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
              child:
                  addVehicleProvider.drivingLicenseOnlineVerifiedCopyPicture !=
                          null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            addVehicleProvider
                                .drivingLicenseOnlineVerifiedCopyPicture!,
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

        /// Permit Authorisation
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Permit Authorisation',
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
                    .permitAuthorisationPictureImagePicker(ImageSource.camera),
                onGalleryTap: () => addVehicleProvider
                    .permitAuthorisationPictureImagePicker(ImageSource.gallery),
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
              child: addVehicleProvider.permitAuthorisationPicture != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.file(
                        addVehicleProvider.permitAuthorisationPicture!,
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
    );
  }
}
