import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zen_app/utils/colors.dart';
import 'package:zen_app/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300), // Adjust the duration as needed
      curve: Curves.ease,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView.builder(
        itemCount: homeScreenItems.length,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return homeScreenItems[index];
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _page == 0 ? zenGreen : secondaryColor),
              label: 'Home',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code,
                  color: _page == 1 ? zenGreen : secondaryColor),
              label: 'qrcode',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: _page == 2 ? zenGreen : secondaryColor),
              label: 'Settings',
              backgroundColor: const Color.fromARGB(255, 54, 53, 50)),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
