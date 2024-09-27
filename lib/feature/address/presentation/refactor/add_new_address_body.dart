import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/response/get_address_response.dart';
import '../widget/addNewAddressScreenWidget/add_information_text_form_field.dart';
import '../widget/addNewAddressScreenWidget/chooce_region_area_toggel.dart';
import '../widget/addNewAddressScreenWidget/information_card_area.dart';
import '../widget/addNewAddressScreenWidget/new_address_map.dart';

class AddNewAddressBody extends StatelessWidget {
  final GetAddressResponseData? getAddressResponseData;
  final bool? isPaymentAddress;

  const AddNewAddressBody({
    super.key,
    this.getAddressResponseData,
    this.isPaymentAddress,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NewAddressGoogleMapWidget(),
            SizedBox(
              height: 10.h,
            ),
            InformationCardArea(getAddressResponseData: getAddressResponseData),
            SizedBox(
              height: 15.h,
            ),
           const ChooceRegionAreaFromToggel(),
            SizedBox(
              height: 15.h,
            ),
            AddAddressInformationFromTextFormField(
                isPaymentAddress: isPaymentAddress,
                getAddressResponseData: getAddressResponseData),
          ],
        ),
      ),
    );
  }



 


 
}

