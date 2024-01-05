import 'package:flutter/material.dart';

import '../widgets/MyBottomNavBar_admin.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyBottomNavBar(),
        body: Container(
      child: Center(
        child: Text('Message',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
      ),
    ));
  }
}
