import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Pages/FormPage.dart';
import 'package:flutter_ujilevel/Pages/LandingPage.dart';
import 'package:flutter_ujilevel/Pages/ProfilePage.dart';

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentTab;
  final ValueChanged<int> onTabChanged;

  CustomBottomNavigationBar({required this.currentTab, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => onTabChanged(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => onTabChanged(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentTab == 1 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
