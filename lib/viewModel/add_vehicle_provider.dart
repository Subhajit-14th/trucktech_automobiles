import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddVehicleProvider with ChangeNotifier {
  final TextEditingController _dateOfInwardController = TextEditingController();
  TextEditingController get dateOfInwardController => _dateOfInwardController;

  final TextEditingController _vehicleNoController = TextEditingController();
  TextEditingController get vehicleNoController => _vehicleNoController;

  String? _selectdServiceType;
  String? get selectdServiceType => _selectdServiceType;

  final TextEditingController _driverVoiceController = TextEditingController();
  TextEditingController get driverVoiceController => _driverVoiceController;

  final List<String> _dropdownServiceType = [
    'PAID',
    'AMC',
    'EWP',
    'WARRANTY',
    'INSURANCE(Accidental)'
  ];
  List<String> get dropdownServiceType => _dropdownServiceType;

  List<String> _selectedMechanicsNames = [];
  List<String> get selectedMechanicsNames => _selectedMechanicsNames;

  final List<String> _dropdownMechanicsName = [
    "Mechanic A",
    "Mechanic B",
    "Mechanic C",
    "Mechanic D",
    "Mechanic E",
    "Mechanic F",
  ];
  List<String> get dropdownMechanicsName => _dropdownMechanicsName;

  String? _selectedType;
  String? get selectedType => _selectedType;

  final List<String> _dropdownTypes = [
    'WORKSHOP',
    'BREAKDOWN',
    'ACCIDENTAL',
    'AT-SITE'
  ];
  List<String> get dropdownType => _dropdownTypes;

  final TextEditingController _locationController = TextEditingController();
  TextEditingController get locationController => _locationController;

  final TextEditingController _atSiteLocationController =
      TextEditingController();
  TextEditingController get atSiteLocationController =>
      _atSiteLocationController;

  /// set service type
  void setServiceType(String serviceType) {
    _selectdServiceType = serviceType;
    notifyListeners();
  }

  /// set Mechanics Name
  void setMechanicsName(List<String> mechanicsNames) {
    _selectedMechanicsNames = mechanicsNames;
    notifyListeners();
  }

  /// set Type
  void setType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  /// ------------------- Form 2nd Step ------------------

  File? _clusterMeterPictureImage;
  final ImagePicker _picker = ImagePicker();

  File? get clusterMeterPictureImage => _clusterMeterPictureImage;

  // Function to pick cluster meter image
  Future<void> clusterMeterPictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _clusterMeterPictureImage = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  File? _vehiclePictureFromFront;
  File? get vehiclePictureFromFront => _vehiclePictureFromFront;

  // Function to pick vehicle picture from front image
  Future<void> vehiclePictureFromFrontImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _vehiclePictureFromFront = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  String? _selectedTrailOfVehicle;
  String? get selecteddTrailOfVehicle => _selectedTrailOfVehicle;

  final List<String> _trailOfVehicleValues = [
    'Yes',
    'No',
  ];
  List<String> get trailOfVehicleValues => _trailOfVehicleValues;

  /// set trail of vehicle (Yes/No)
  void setTrailOfVehicle(String trailOfVehicle) {
    _selectedTrailOfVehicle = trailOfVehicle;
    notifyListeners();
  }

  //// --------------------- Form 3 ---------------------
  final TextEditingController _jobCardNoController = TextEditingController();
  TextEditingController get jobCardNoController => _jobCardNoController;
}
