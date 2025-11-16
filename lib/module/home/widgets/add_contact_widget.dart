import 'dart:io';

import 'package:contact/app_colors.dart';
import 'package:contact/contact_data.dart';
import 'package:contact/module/home/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AddContactWidget extends StatefulWidget {
  final Function(Contact) addUser;
  const AddContactWidget({super.key, required this.addUser});

  @override
  State<AddContactWidget> createState() => _AddContactWidgetState();
}

class _AddContactWidgetState extends State<AddContactWidget> {
  File? image;
  String name = 'User Name';
  String email = 'example@email.com';
  String phone = '+200000000000';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          spacing: 8.h,
          children: [
            Row(
              spacing: 10.w,
              children: [
                GestureDetector(
                  child: Container(
                    height: 146.h,
                    width: 143.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(
                        color: AppColors.secondary,
                        width: 1.w,
                      ),
                    ),
                    child: Lottie.asset(
                      'assets/animations/image_picker.json',
                      repeat: false,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.h,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        color: AppColors.secondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 192.w,
                      height: 1,
                      color: AppColors.secondary,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.inter(
                        color: AppColors.secondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 192.w,
                      height: 1,
                      color: AppColors.secondary,
                    ),
                    Text(
                      phone,
                      style: GoogleFonts.inter(
                        color: AppColors.secondary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 1.h),
            TextFormFieldWidget(
              hint: 'Enter Contact Name',
              onChanged: (val) {
                setState(() {
                  name = val;
                  if (val.isEmpty) {
                    name = 'User Name';
                  }
                });
              },
            ),
            TextFormFieldWidget(
              hint: 'Enter Contact Email',
              onChanged: (val) {
                setState(() {
                  email = val;
                  if (val.isEmpty) {
                    email = 'example@email.com';
                  }
                });
              },
            ),
            TextFormFieldWidget(
              hint: 'Enter Contact Phone Number',
              onChanged: (val) {
                setState(() {
                  phone = val;
                  if (val.isEmpty) {
                    phone = '+200000000000';
                  }
                });
              },
            ),
            SizedBox(height: 1.h),
            MaterialButton(
              color: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              onPressed: () {
                widget.addUser(
                  Contact(
                    email: email,
                    name: name,
                    phone: phone,
                    imagePath: image?.path,
                  ),
                );
              },
              child: Text(
                'Enter User',
                style: GoogleFonts.inter(
                  color: AppColors.primary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
