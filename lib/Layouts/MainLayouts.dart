import 'package:flutter/material.dart';
import 'package:flutter_ujilevel/Pages/ProfilePage.dart';
import '../Components/components.dart';

class MainLayouts extends StatefulWidget {
  const MainLayouts({super.key});

  @override
  State<MainLayouts> createState() => _MainLayoutsState();
}

class _MainLayoutsState extends State<MainLayouts> {
  late PageController _pageController;
  late BottomNavbarItems selectedIndex;

  List navbarItems = [
    BottomNavbarItems(icon: Icons.home_filled),
    BottomNavbarItems(icon: Icons.search_rounded),
    BottomNavbarItems(icon: Icons.favorite_rounded),
    BottomNavbarItems(icon: Icons.library_books_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    selectedIndex = navbarItems[0];
  }

  void pageChanged(int i) {
    _pageController.jumpToPage(i);
    if (navbarItems[i] != selectedIndex) {
      setState(() {
        selectedIndex = navbarItems[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: pageChanged,
        children: const <Widget>[
          Text("homepage"),
          Text('Search'),
          Text('Watchlist'),
          Profile(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
                navbarItems.length,
                (i) => GestureDetector(
                      onTap: () {
                        pageChanged(i);
                      },
                      child: // naviagation
                          Container(
                        height: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              width: navbarItems[i] == selectedIndex ? 40 : 0,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            Icon(
                              navbarItems[i].icon,
                              color: navbarItems[i] == selectedIndex
                                  ? Colors.blueAccent
                                  : Colors.black.withOpacity(0.2),
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                      // end navigation,
                    )),
          ],
        ),
      ),
    );
  }
}
