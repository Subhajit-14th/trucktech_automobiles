import 'package:flutter/material.dart';

class BasicDetailsClaimnoAmountModel {
  TextEditingController claimNoController;
  TextEditingController amountController;
  String? indicatior;

  BasicDetailsClaimnoAmountModel({
    TextEditingController? claimNoController,
    TextEditingController? amountController,
    this.indicatior,
  })  : claimNoController = claimNoController ?? TextEditingController(),
        amountController = amountController ?? TextEditingController();
}
