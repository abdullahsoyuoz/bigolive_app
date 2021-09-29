import 'package:bigolive_app/UserPages/HomePage.dart';
import 'package:bigolive_app/UserPages/OrderPage.dart';
import 'package:bigolive_app/UserPages/ProfilePage.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/customBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants/app_configurations.dart' as settingRepo;

class MainPageView extends StatefulWidget {
  @override
  MainPageViewState createState() => MainPageViewState();
}
class MainPageViewState extends State<MainPageView> {
  PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController  = PageController(initialPage: currentIndex);
    settingRepo.pageViewState.value = this;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      OrderPage(),
      ProfilePage(FakeData.userList[2].subUserList[0], mainPageViewState: this,),
    ];

    List<BottomNavyBarItem> bottomNavBarItems = [
      BottomNavyBarItem(
        inactiveColor: appColorGoldDark,
        activeColor: appColorGoldDark,
        icon: Icon(FontAwesomeIcons.home,),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Anasayfa", style: TextStyle(fontSize: 14),),
        )),
      BottomNavyBarItem(
          inactiveColor: Colors.red,
          activeColor: Colors.red,
          icon: Icon(FontAwesomeIcons.list,),
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Siparişler", style: TextStyle(fontSize: 14),),
          )),
      BottomNavyBarItem(
          inactiveColor: Colors.blueAccent,
          activeColor: Colors.blueAccent,
          icon: Icon(FontAwesomeIcons.user,),
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Profil", style: TextStyle(fontSize: 14),),
          )),
    ];

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavyBar(
          items: bottomNavBarItems,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          selectedIndex: currentIndex,
          backgroundColor: Colors.white,
          showElevation: true,
          animationDuration: Duration(milliseconds: 250),
          onItemSelected: (value) {
            setState(() {
              pageController.animateToPage(value, duration: Duration(milliseconds: 100), curve: Curves.easeInOutExpo);
            });
          },
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => pages[currentIndex],
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
