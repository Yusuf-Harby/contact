import 'package:contact/core/app_colors.dart';
import 'package:contact/data/models/contact_data.dart';
import 'package:contact/module/home/widgets/add_contact_widget.dart';
import 'package:contact/module/home/widgets/contact_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Image.asset('assets/icons/logo.png', width: 117.w, height: 39.h),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16.sp),
        child: contacts.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 100.h),
                  Lottie.asset(
                    'assets/animations/empty_list.json',
                    repeat: false,
                  ),
                  Text(
                    'There is No Contacts Added Here',
                    style: GoogleFonts.inter(
                      color: AppColors.secondary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: contacts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14.w,
                        mainAxisSpacing: 14.h,
                        childAspectRatio: 177.w / 300.h,
                      ),
                      itemBuilder: (_, index) => ContactCardWidget(
                        contact: contacts[index],
                        delete: () {
                          setState(() {
                            contacts.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 8.h,
        children: [
          contacts.isNotEmpty
              ? SizedBox(
                  width: 56.w,
                  height: 56.w,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.red,
                    child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      width: 16.w,
                      height: 20.h,
                    ),
                    onPressed: () {
                      contacts.removeLast();
                      setState(() {});
                    },
                  ),
                )
              : SizedBox(),
          SizedBox(
            width: 56.w,
            height: 56.w,
            child: FloatingActionButton(
              child: Icon(Icons.add, size: 29.w, color: AppColors.primary),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  context: context,
                  builder: (context) => AddContactWidget(
                    addUser: (Contact contact) {
                      contacts.add(contact);
                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
