import 'package:flutter/material.dart';
import 'package:flutter_e_commece_app/user/bill_summery.dart';
import 'package:flutter_e_commece_app/widgets/button/common_button.dart';
import 'package:flutter_e_commece_app/widgets/fields/comon_textfields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool _rememberMe = false;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController codecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController provincecontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back)),
                Spacer(),
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 30.sp,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Billing Address',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CommonTextField(
                        controller: namecontroller, hintText: 'first name')),
                SizedBox(width: 10.w),
                Expanded(
                    child: CommonTextField(
                        controller: namecontroller, hintText: 'last name')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CommonTextField(controller: emailcontroller, hintText: 'email'),
            SizedBox(
              height: 20.h,
            ),
            CommonTextField(controller: addresscontroller, hintText: 'address'),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CommonTextField(
                        controller: codecontroller, hintText: 'zip code')),
                SizedBox(width: 10.w),
                Expanded(
                    child: CommonTextField(
                        controller: numbercontroller, hintText: 'phone')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CommonTextField(
                        controller: provincecontroller, hintText: 'province')),
                SizedBox(width: 10.w),
                Expanded(
                    child: CommonTextField(
                  controller: citycontroller,
                  hintText: 'city',
                )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text('My billing and shipping\n address are same'),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            ComonButton(
                title: 'Next',
                onTap: () {
                  Get.to(BillSummery());
                })
          ],
        ),
      ),
    );
  }
}
