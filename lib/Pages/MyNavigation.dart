import 'package:flutter/material.dart';
import '../Components/BottomNav.dart';
import 'LandingPage.dart';
import 'ProfilePage.dart';

class MyNavigation extends StatefulWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  int currentTab = 0;

  final List<Widget> screens = [
    MyHomePage(),
    Profile(
      profile: {},
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyHomePage();

  void onTabChanged(int index) {
    setState(() {
      currentScreen = screens[index];
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentTab: currentTab,
        onTabChanged: onTabChanged,
      ),
    );
  }
}
