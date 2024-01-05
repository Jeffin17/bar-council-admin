
import 'package:flutter/material.dart';

import '../pages/Search.dart';
import '../pages/access.dart';
import '../pages/homepage.dart';
import '../pages/message.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int myIndex = 0;

  void _onTappedNav(int index) {
    setState(() {
      myIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Access(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Search(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Message(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,

      unselectedItemColor: Colors.blue,
      elevation: 5.0,
      // selectedFontSize: 15,
      currentIndex: myIndex,
      onTap: _onTappedNav,
      items: [

        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white, size: 30),
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Container(
            width: 30,
            height: 30,
            child: Image(
              image: AssetImage('assets/images/access-control_whitebg(1).png'),
            ),
          ),
          label: 'Permission',
          backgroundColor: Colors.black,
        ),

        BottomNavigationBarItem(
          icon: Container(
            width: 30,
            height: 30,
            child: Image(
              image: AssetImage('assets/images/search (1).png'),
            ),
          ),
          label: 'Search',
          backgroundColor: Colors.black,
        ),

        BottomNavigationBarItem(
          icon: Container(
            width: 30,
            height: 30,
            child: Image(
              image: AssetImage('assets/images/chat-box_whitebg(1).png'),
            ),
          ),
          label: 'Message',
          backgroundColor: Colors.black,
        ),

      ],
    );
  }
}