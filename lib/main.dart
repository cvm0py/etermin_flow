// import 'package:etermin/widgets/profile.dart';
//import 'package:etermin/screens/salonListingPage.dart';
import 'package:etermin/screens/beautySalonCategory.dart';
import 'package:flutter/material.dart';
import 'screens/loginPage.dart';
import 'utils/routes.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'screens/homePage.dart';

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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (context) => BeautySalonCategory(),
        MyRoutes.homeRoute: (context) => HomePageWidget(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
