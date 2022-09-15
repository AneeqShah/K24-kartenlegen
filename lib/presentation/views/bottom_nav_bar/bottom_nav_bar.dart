import 'package:flutter/material.dart';
import 'package:k24/config/front_end_config.dart';
import 'package:k24/presentation/views/home/home_view.dart';

import '../chat_list/chat_list.dart';

class BottomNavBody extends StatefulWidget {
  const BottomNavBody({Key? key}) : super(key: key);

  @override
  _BottomNavBodyState createState() => _BottomNavBodyState();
}

class _BottomNavBodyState extends State<BottomNavBody> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeView(),
    const ChatList(),
    const Text('data'),
    const Text('data'),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/images/home.png'),
                color: _currentIndex == 0
                    ? FrontEndConfigs.kPrimaryColor
                    : Colors.grey,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/images/fav.png'),
                color: _currentIndex == 1
                    ? FrontEndConfigs.kPrimaryColor
                    : Colors.grey,
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/images/product.png'),
                color: _currentIndex == 2
                    ? FrontEndConfigs.kPrimaryColor
                    : Colors.grey,
              ),
              label: 'Product'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/images/person.png'),
                color: _currentIndex == 3
                    ? FrontEndConfigs.kPrimaryColor
                    : Colors.grey,
              ),
              label: 'Account'),
        ],
      ),
    );
  }
}
