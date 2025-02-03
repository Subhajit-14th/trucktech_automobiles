import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trucktech_automobiles/utlis/assets/app_colors.dart';
import 'package:trucktech_automobiles/utlis/widgets/CommonTextField.dart';
import 'package:trucktech_automobiles/viewModel/add_vehicle_provider.dart';

class AtSiteWorkFieldScreen extends StatelessWidget {
  const AtSiteWorkFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Job card no
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Job Card No',
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
            controller: context.read<AddVehicleProvider>().jobCardNoController,
            labelText: 'Job Card No',
            hintText: 'Enter your job card no...',
          ),
        ),
        SizedBox(height: height * 0.02),

        if (context.read<AddVehicleProvider>().selectdServiceType ==
                "WARRANTY" ||
            context.read<AddVehicleProvider>().selectdServiceType == "AMC" ||
            context.read<AddVehicleProvider>().selectdServiceType == "EWP") ...[
          /// CLAIM NO. & Amount
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'CLAIM NO. & Amount',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: height * 0.01),
          Consumer<AddVehicleProvider>(
              builder: (context, addVehicleProvider, child) {
            return ListView.builder(
              itemCount: addVehicleProvider.claimNoAndAmountItems.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: CommonTextField(
                          controller: addVehicleProvider
                              .claimNoAndAmountItems[index].claimNoController,
                          labelText: 'Claim No.',
                          hintText: 'Enter your claim no....',
                        ),
                      ),
                      Expanded(
                        child: CommonTextField(
                          controller: addVehicleProvider
                              .claimNoAndAmountItems[index].amountController,
                          labelText: 'Amount',
                          hintText: 'Enter your CLAIM NO. & Amount...',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (addVehicleProvider
                                  .claimNoAndAmountItems[index].indicatior ==
                              'main') {
                            addVehicleProvider.addClaimNoAndAmountItem();
                          } else {
                            addVehicleProvider
                                .removeClaimNoAndAmountItem(index);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor.subItemColor,
                            shape: BoxShape.circle,
                          ),
                          child: addVehicleProvider.claimNoAndAmountItems[index]
                                      .indicatior ==
                                  'main'
                              ? Icon(
                                  Icons.add_rounded,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.remove_rounded,
                                  color: Colors.red,
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
          SizedBox(height: height * 0.02),
        ],

        if (context.read<AddVehicleProvider>().selectdServiceType == "PAID" ||
            context.read<AddVehicleProvider>().selectdServiceType ==
                "INSURANCE (Accidental)") ...[
          /// LABOUR AMOUNT & PARTS AMOUNT
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Labour amount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      CommonTextField(
                        controller: context
                            .read<AddVehicleProvider>()
                            .labourAmountController,
                        labelText: 'Labour amount',
                        hintText: 'Enter your labour amount....',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Parts amount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      CommonTextField(
                        controller: context
                            .read<AddVehicleProvider>()
                            .partsAmountController,
                        labelText: 'Parts amount',
                        hintText: 'Enter your parts amount...',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

        /// Deputation Charges
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Deputation Charges',
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
                context.read<AddVehicleProvider>().deputationChargesController,
            labelText: 'Deputation Charges',
            hintText: 'Enter your deputation charges...',
          ),
        ),
        SizedBox(height: height * 0.02),

        /// Vendeor Work
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Vendeor Work',
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
                value: addVehicleProvider.vendorWork,
                hint: Text(
                  addVehicleProvider.vendorWork ?? 'Choose one',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                isExpanded: true,
                items: addVehicleProvider.vendorWorkValue.map((String item) {
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
                  addVehicleProvider.setVendorWorkValue(newValue!);
                },
                // Customizing the selected item display
                selectedItemBuilder: (BuildContext context) {
                  return addVehicleProvider.vendorWorkValue.map((String item) {
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
        context.watch<AddVehicleProvider>().vendorWork == "Yes"
            ? Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vendor Bill No',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          CommonTextField(
                            controller: context
                                .read<AddVehicleProvider>()
                                .vendorBillNoController,
                            labelText: 'vendor bill no',
                            hintText: 'Enter your vendor bill no....',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          CommonTextField(
                            controller: context
                                .read<AddVehicleProvider>()
                                .vendorAmountController,
                            labelText: 'amount',
                            hintText: 'Enter your amount...',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
