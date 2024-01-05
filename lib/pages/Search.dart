
import 'package:flutter/material.dart';

import '../widgets/MyBottomNavBar_admin.dart';

class Search extends StatelessWidget{
  const Search ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      body: Container(
          child: const Center(
              child: Text(
                'Search Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ))),
    );
  }
}