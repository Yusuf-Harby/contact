import 'dart:io';
import 'package:contact/core/app_colors.dart';
import 'package:contact/data/models/contact_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactCardWidget extends StatelessWidget {
  final Contact contact;
  final void Function() delete;
  const ContactCardWidget({
    super.key,
    required this.contact,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.secondary,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: contact.imagePath == null
                    ? Image.asset(
                        'assets/images/person.jpg',
                        width: 177.w,
                        height: 177.h,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(contact.imagePath!),
                        width: 177.w,
                        height: 177.h,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.secondary,
                ),
                child: Text(
                  contact.name,
                  style: GoogleFonts.inter(color: AppColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/email.svg'),
                    SizedBox(width: 8.w),
                    Text(
                      contact.email,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        color: AppColors.primary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/phone.svg'),
                    SizedBox(width: 8.w),
                    Text(
                      contact.phone,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        color: AppColors.primary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                MaterialButton(
                  color: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  onPressed: delete,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/delete.svg'),
                      SizedBox(width: 5.w),
                      Text(
                        'Delete',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
