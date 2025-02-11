import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:trucktech_automobiles/model/AddVehicles/basic_details_claimNo_Amount_Model.dart';

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

  File? _emailScreenShotPictureImage;
  File? get emailScreenShotPictureImage => _emailScreenShotPictureImage;

  // Function to pick cluster meter image
  Future<void> emailScreenShotPictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _emailScreenShotPictureImage = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

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

  /// --------------------- WorkShop Selection -------------------------
  final List<BasicDetailsClaimnoAmountModel> _claimNoAndAmountItems = [
    BasicDetailsClaimnoAmountModel(
      claimNoController: TextEditingController(),
      amountController: TextEditingController(),
      indicatior: "main",
    ),
  ];
  List<BasicDetailsClaimnoAmountModel> get claimNoAndAmountItems =>
      _claimNoAndAmountItems;

  // Method to add a new item
  void addClaimNoAndAmountItem() {
    _claimNoAndAmountItems.add(
      BasicDetailsClaimnoAmountModel(
        claimNoController: TextEditingController(),
        amountController: TextEditingController(),
        indicatior: "notMain",
      ),
    );
    notifyListeners(); // Notify the UI about the change
  }

  // method to remove the index item from the list
  void removeClaimNoAndAmountItem(index) {
    _claimNoAndAmountItems.removeAt(index);
    notifyListeners();
  }

  final TextEditingController _labourAmountController = TextEditingController();
  TextEditingController get labourAmountController => _labourAmountController;

  final TextEditingController _partsAmountController = TextEditingController();
  TextEditingController get partsAmountController => _partsAmountController;

  String? _vendorWork;
  String? get vendorWork => _vendorWork;

  final List<String> _vendorWorkValue = ['Yes', 'No'];
  List<String> get vendorWorkValue => _vendorWorkValue;

  /// set service type
  void setVendorWorkValue(String vendorWork) {
    _vendorWork = vendorWork;
    notifyListeners();
  }

  final TextEditingController _vendorBillNoController = TextEditingController();
  TextEditingController get vendorBillNoController => _vendorBillNoController;

  final TextEditingController _vendorAmountController = TextEditingController();
  TextEditingController get vendorAmountController => _vendorAmountController;

  final TextEditingController _deputationChargesController =
      TextEditingController();
  TextEditingController get deputationChargesController =>
      _deputationChargesController;

  /// --------------- Accidental Work ----------------
  final TextEditingController _policyNoController = TextEditingController();
  TextEditingController get policyNoController => _policyNoController;

  final TextEditingController _insuredNameOwnerController =
      TextEditingController();
  TextEditingController get insuredNameOwnerController =>
      _insuredNameOwnerController;

  final TextEditingController _insurancePolicyInsurersController =
      TextEditingController();
  TextEditingController get insurancePolicyInsurersController =>
      _insurancePolicyInsurersController;

  final TextEditingController _periodOfInsuranceController =
      TextEditingController();
  TextEditingController get periodOfInsuranceController =>
      _periodOfInsuranceController;

  final TextEditingController _idvAmountController = TextEditingController();
  TextEditingController get idvAmountController => _idvAmountController;

  final TextEditingController _chassisNoController = TextEditingController();
  TextEditingController get chassisNoController => _chassisNoController;

  final TextEditingController _engineNoController = TextEditingController();
  TextEditingController get engineNoController => _engineNoController;

  final TextEditingController _makeVariantModelColorController =
      TextEditingController();
  TextEditingController get makeVariantModelColorController =>
      _makeVariantModelColorController;

  final TextEditingController _weatherVehicleisNationalPermitController =
      TextEditingController();
  TextEditingController get weatherVehicleisNationalPermitController =>
      _weatherVehicleisNationalPermitController;

  String?
      _selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy;
  String?
      get selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy =>
          _selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy;

  final List<String>
      _whetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue = [
    'Yes',
    'No'
  ];
  List<String>
      get whetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue =>
          _whetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue;

  /// set WhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue
  void setWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue(
      String
          selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy) {
    _selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy =
        selectedWhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicy;
    notifyListeners();
  }

  final TextEditingController _highLightController = TextEditingController();
  TextEditingController get highLightController => _highLightController;

  final TextEditingController _accidentDateController = TextEditingController();
  TextEditingController get accidentDateController => _accidentDateController;

  final TextEditingController _accidentTimeController = TextEditingController();
  TextEditingController get accidentTimeController => _accidentTimeController;

  final TextEditingController _accidentLocationController =
      TextEditingController();
  TextEditingController get accidentLocationController =>
      _accidentLocationController;

  final TextEditingController _causeOfLossController = TextEditingController();
  TextEditingController get causeOfLossController => _causeOfLossController;

  final TextEditingController _reasonOfAccidentCauseOfLoss =
      TextEditingController();
  TextEditingController get reasonOfAccidentCauseOfLoss =>
      _reasonOfAccidentCauseOfLoss;

  final List<String> _VehicleCameToWorkShopByCraneValue = ['Yes', 'No'];
  List<String> get vehicleCameToWorkShopByCraneValue =>
      _VehicleCameToWorkShopByCraneValue;

  String? _selectedVehicleCameToWorkShopByCrane;
  String? get selectedVehicleCameToWorkShopByCrane =>
      _selectedVehicleCameToWorkShopByCrane;

  /// set WhetherVehicleNoEngineNoAndChassisNoCorrectAndMentionedInPolicyValue
  void setSelectedVehicleCameToWorkShopByCrane(
      String selectedVehicleCameToWorkShopByCrane) {
    _selectedVehicleCameToWorkShopByCrane =
        selectedVehicleCameToWorkShopByCrane;
    notifyListeners();
  }

  File? _craneBillPostAccidentPicture;
  File? get craneBillPostAccidentPicture => _craneBillPostAccidentPicture;

  // Function to pick vehicle picture from front image
  Future<void> craneBillPostAccidentPictureImagePicker(
      ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _craneBillPostAccidentPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  final TextEditingController _driverNameController = TextEditingController();
  TextEditingController get driverNameController => _driverNameController;

  final TextEditingController _licenseNoController = TextEditingController();
  TextEditingController get licenseNoController => _licenseNoController;

  final TextEditingController _driverLicenseIssuingAuthorityController =
      TextEditingController();
  TextEditingController get driverLicenseIssuingAuthorityController =>
      _driverLicenseIssuingAuthorityController;

  String? _selectedInjusryDriverValue;
  String? get selectedInjusryDriverValue => _selectedInjusryDriverValue;

  final List<String> _injusryDriverValue = ['Yes', 'No'];
  List<String> get injusryDriverValue => _injusryDriverValue;

  /// set injusry Drive rValue
  void setInjusryDriverValue(String injusryDriverValue) {
    _selectedInjusryDriverValue = injusryDriverValue;
    notifyListeners();
  }

  File? _injusryDriverPicture;
  File? get injusryDriverPicture => _injusryDriverPicture;

  // Function to pick vehicle picture from front image
  Future<void> injusryDriverPictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _injusryDriverPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  String? _selectedLoadedOrNotValue;
  String? get selectedLoadedOrNotValue => _selectedLoadedOrNotValue;

  final List<String> _loadedOrNotValue = ['Yes', 'No'];
  List<String> get loadedOrNotValue => _loadedOrNotValue;

  /// set injusry Drive rValue
  void setLoadedOrNotValue(String loadedOrNot) {
    _selectedLoadedOrNotValue = loadedOrNot;
    notifyListeners();
  }

  File? _loadedDocumentsPicture;
  File? get loadedDocumentsPicture => _loadedDocumentsPicture;

  // Function to pick vehicle picture from front image
  Future<void> loadedDocumentsPictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _loadedDocumentsPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  String? _selectedPoliceActionValue;
  String? get selectedPoliceActionValue => _selectedPoliceActionValue;

  final List<String> _policeActionValueValue = ['Yes', 'No'];
  List<String> get policeActionValueValue => _policeActionValueValue;

  /// set police action Value
  void setPoliceActionValue(String policeActionValue) {
    _selectedPoliceActionValue = policeActionValue;
    notifyListeners();
  }

  File? _policeActionPicture;
  File? get policeActionPicture => _policeActionPicture;

  // Function to pick vehicle picture from front image
  Future<void> policeActionPicturePictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _policeActionPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  String? _selectedThirdPartyLossInjuriesValue;
  String? get selectedThirdPartyLossInjuriesValue =>
      _selectedThirdPartyLossInjuriesValue;

  final List<String> _thirdPartyLossInjuriesValue = ['Yes', 'No'];
  List<String> get thirdPartyLossInjuriesValue => _thirdPartyLossInjuriesValue;

  /// set third party loss injuries Value
  void setThirdPartyLossinjuriesValue(String thirdPartyValue) {
    _selectedThirdPartyLossInjuriesValue = thirdPartyValue;
    notifyListeners();
  }

  File? _registrationCertificatePicture;
  File? get registrationCertificatePicture => _registrationCertificatePicture;

  // Function to pick vehicle picture from front image
  Future<void> registrationCertificatePictureImagePicker(
      ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _registrationCertificatePicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  File? _registrationCertificateOnlineVerifiedCopyPicture;
  File? get registrationCertificateOnlineVerifiedCopyPicture =>
      _registrationCertificateOnlineVerifiedCopyPicture;

  // Function to pick vehicle picture from front image
  Future<void> registrationCertificateOnlineVerifiedCopyPictureImagePicker(
      ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _registrationCertificateOnlineVerifiedCopyPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  File? _insurancePolicyPicture;
  File? get insurancePolicyPicture => _insurancePolicyPicture;

  // Function to pick vehicle picture from front image
  Future<void> insurancePolicyPictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _insurancePolicyPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  File? _drivingLicensePicture;
  File? get drivingLicensePicture => _drivingLicensePicture;

  // Function to pick vehicle picture from front image
  Future<void> drivingLicensePictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _drivingLicensePicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  File? _drivingLicenseOnlineVerifiedCopyPicture;
  File? get drivingLicenseOnlineVerifiedCopyPicture =>
      _drivingLicenseOnlineVerifiedCopyPicture;

  // Function to Driving License Online Verified Copy Picture image
  Future<void> drivingLicenseOnlineVerifiedCopyPictureImagePicker(
      ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _drivingLicenseOnlineVerifiedCopyPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }

  File? _permitAuthorisationPicture;
  File? get permitAuthorisationPicture => _permitAuthorisationPicture;

  // Function to Driving License Online Verified Copy Picture image
  Future<void> permitAuthorisationPictureImagePicker(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      _permitAuthorisationPicture = File(pickedFile.path);
      notifyListeners(); // Notify UI to update
    }
  }
}
