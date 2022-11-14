

import 'dart:io';

import 'package:flutter/material.dart';
import 'screen/dashboard/MyNavigationBar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    foregroundColor: Colors.white,
                    centerTitle: true,
                    titleTextStyle:  TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                   systemOverlayStyle: Platform.isAndroid
                      ? const SystemUiOverlayStyle(
                     statusBarColor: Colors.black,
                     statusBarBrightness: Brightness.light,
                     statusBarIconBrightness: Brightness.light,
                      systemNavigationBarIconBrightness: Brightness.light,
                    ) : SystemUiOverlayStyle.light),
                ),
            home: MyNavigationBar(),
        );
      }
    );
  }
}


