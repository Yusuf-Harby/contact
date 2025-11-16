import 'package:contact/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: Image.asset(
              'assets/icons/logo.png',
              width: 117.w,
              height: 39.h,
            ),
          ),
          body: Center(child: Text('Welcome to the Contact List App!')),
          floatingActionButton: SizedBox(
            width: 56.w,
            height: 56.w,
            child: FloatingActionButton(
              onPressed: () {
                // Action to add a new contact
              },
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.add, size: 29.w, color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
