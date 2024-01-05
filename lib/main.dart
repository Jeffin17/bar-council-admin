import 'package:bar_council_main_admin/pages/edit.dart';
import 'package:bar_council_main_admin/pages/homepage.dart';
import 'package:bar_council_main_admin/pages/login_admin.dart';
import 'package:bar_council_main_admin/pages/registration.dart';
import 'package:bar_council_main_admin/widgets/MyBottomNavBar_admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        ),
        home:  const MyHomePage());
  }
}                               /*current page: Login(), Edit(), */
