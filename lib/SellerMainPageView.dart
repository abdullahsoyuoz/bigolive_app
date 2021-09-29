import 'package:bigolive_app/SellerPages/SellerProfilePage.dart';
import 'package:flutter/material.dart';

class SellerMainPageView extends StatefulWidget {
  @override
  SellerMainPageViewState createState() => SellerMainPageViewState();
}

class SellerMainPageViewState extends State<SellerMainPageView> {
  PageController sellerPageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    sellerPageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    sellerPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List sellerPages = [
      SellerProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: sellerPageController,
        itemCount: sellerPages.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => sellerPages[currentIndex],
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
