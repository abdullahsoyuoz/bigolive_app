import 'package:bigolive_app/Utility/CustomAppBar.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'PaymentPages/PaymentMethodsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _listViewController;
  double sliderValue = 0.6;

  @override
  void initState() {
    super.initState();
    _listViewController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _listViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("BIGO Resmi Bayi", false),
      body: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            shrinkWrap: true,
            controller: _listViewController,
            padding: EdgeInsets.only(
              top: getSize(context) * 20 / 300,
              left: getSize(context) * 20 / 300,
              right: getSize(context) * 20 / 300,
            ),
            itemCount: FakeData.userList.length,
            itemBuilder: (context, index) {
              FakeUser user = FakeData.userList[index];
              return buildCardItem(context, index, user);
            },
          )),
    );
  }

  Widget buildCardItem(BuildContext context, int index, FakeUser user) {
    return Column(
      children: [
        Container(
          width: getSize(context),
          height: getSize(context) * 80 / 300,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: appColorBrownDark.withOpacity(0.35),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                topLeft: Radius.circular(80),
              )),
          child: Stack(
            children: [
              //  bottomAlign
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: getSize(context) * 20 / 300,
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(context) * 20 / 300),
                        child: StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: user.stockCount.toInt(),
                          direction: Axis.horizontal,
                          selectedColor: appColorNavyBlueDark,
                          unselectedColor: Colors.white,
                          padding: 0,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PaymentMethodsPage(user),
                            ));
                      },
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: getSize(context) * 30 / 300,
                        decoration: BoxDecoration(
                            color: appColorBlueLigth,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            )),
                        child: Center(
                          child: Text(
                            "Sipariş ver",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //  topAlign
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: getSize(context) * 40 / 300 + 4,
                          height: getSize(context) * 40 / 300 + 4,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 4),
                                  shape: BoxShape.circle),
                              child: CircleAvatar(
                                radius: getSize(context) * 20 / 300,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getSize(context) * 20 / 300),
                                    child: Image.network(
                                      user.profilePhotoUrl,
                                      width: getSize(context) * 40 / 300,
                                      height: getSize(context) * 40 / 300,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getSize(context) * 5 / 300,
                            left: getSize(context) * 5 / 300,
                          ),
                          child: Text(
                            user.name,
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: getSize(context) * 10 / 300,
                        height: getSize(context) * 10 / 300,
                        decoration: BoxDecoration(
                            color: user.isOnline
                                ? Colors.green
                                : Colors.grey.shade400,
                            shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: user.subUserList.length,
          itemBuilder: (context, index) {
            var subUser = user.subUserList[index];
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: appColorGoldLight,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    width: getSize(context),
                    height: getSize(context) * 80 / 300,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        color: appColorBrownDark.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          topLeft: Radius.circular(80),
                        )),
                    child: Stack(
                      children: [
                        //  bottomAlign
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: getSize(context) * 20 / 300,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getSize(context) * 20 / 300),
                                  child: StepProgressIndicator(
                                    totalSteps: 100,
                                    currentStep: subUser.stockCount.toInt(),
                                    direction: Axis.horizontal,
                                    selectedColor: appColorNavyBlueDark,
                                    unselectedColor: Colors.white,
                                    padding: 0,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            PaymentMethodsPage(user),
                                      ));
                                },
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: getSize(context) * 30 / 300,
                                  decoration: BoxDecoration(
                                      color: appColorBlueLigth,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                      )),
                                  child: Center(
                                    child: Text(
                                      "Sipariş ver",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //  topAlign
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getSize(context) * 40 / 300 + 4,
                                    height: getSize(context) * 40 / 300 + 4,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 4),
                                            shape: BoxShape.circle),
                                        child: CircleAvatar(
                                          radius: getSize(context) * 20 / 300,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getSize(context) *
                                                          20 /
                                                          300),
                                              child: Image.network(
                                                subUser.profilePhotoUrl,
                                                width:
                                                    getSize(context) * 40 / 300,
                                                height:
                                                    getSize(context) * 40 / 300,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getSize(context) * 5 / 300,
                                      left: getSize(context) * 5 / 300,
                                    ),
                                    child: Text(
                                      subUser.name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  width: getSize(context) * 10 / 300,
                                  height: getSize(context) * 10 / 300,
                                  decoration: BoxDecoration(
                                      color: subUser.isOnline
                                          ? Colors.green
                                          : Colors.grey.shade400,
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
