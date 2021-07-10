
import 'package:etermin/screens/beautySalonCategory.dart';
import 'package:etermin/screens/category_list.dart';
import 'package:etermin/screens/petOrBeautySalon.dart';
import 'package:flutter/material.dart';
import 'screens/loginPage.dart';
import 'utils/routes.dart';
import 'testPurpose/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      
      
      routes: {
        "/": (context) => PetOrBeautyWidget(),
        MyRoutes.homeRoute: (context) => HomePageWidget(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
