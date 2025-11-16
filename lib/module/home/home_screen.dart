import 'package:contact/app_colors.dart';
import 'package:contact/contact_data.dart';
import 'package:contact/module/home/widgets/add_contact_widget.dart';
import 'package:contact/module/home/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Image.asset('assets/icons/logo.png', width: 117.w, height: 39.h),
      ),
      body: Column(
        children: [
          SizedBox(height: 100.h),
          Lottie.asset('assets/animations/empty_list.json', repeat: false),
          Text(
            'There is No Contacts Added Here',
            style: GoogleFonts.inter(
              color: AppColors.secondary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 56.w,
        height: 56.w,
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 29.w, color: AppColors.primary),
          onPressed: () {
            showBottomSheet(context);
          },
        ),
      ),
    );
  }

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      context: context,
      builder: (context) => AddContactWidget(addUser: (Contact contact) {  },),
    );
  }
}
