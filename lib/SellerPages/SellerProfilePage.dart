import 'package:bigolive_app/SellerPages/SellerOrderPages/SellerOrderPage.dart';
import 'package:bigolive_app/SellerPages/SellerOrderPages/SellerRequestsPage.dart';
import 'package:bigolive_app/UserPages/AuthPages/LoginPage.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerProfilePage extends StatefulWidget {
  @override
  _SellerProfilePageState createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
            width: getSize(context),
            height: MediaQuery.of(context).size.height,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top * 0.5),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 2,
                bottom: 24,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getSize(context) * 20 / 300,
                    right: getSize(context) * 20 / 300,
                  ),
                  child: Container(
                    width: getSize(context),
                    height: getSize(context) * 50 / 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: appColorGoldDark, width: 2)),
                    padding: EdgeInsets.symmetric(
                        horizontal: getSize(context) * 5 / 300),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.network(
                            FakeData.userList[0].subUserList[0].profilePhotoUrl,
                            height: getSize(context) * 40 / 300,
                            width: getSize(context) * 40 / 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "${FakeData.userList[0].subUserList[0].name}",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10, left: getSize(context) * 45 / 300),
                  child: Row(
                    children: [
                      Text(
                        "ilgili Bayi: ",
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.network(
                            FakeData.userList[0].profilePhotoUrl,
                            height: getSize(context) * 25 / 300,
                            width: getSize(context) * 25 / 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "${FakeData.userList[0].name}",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 18,
                      left: getSize(context) * 20 / 300,
                      right: getSize(context) * 20 / 300,
                    ),
                    child: Container(
                      width: getSize(context) * 170 / 300,
                      height: getSize(context) * 60 / 300,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.only(
                          top: getSize(context) * 10 / 300, left: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kullanılabilir Kredi",
                            style: GoogleFonts.poppins(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                letterSpacing: 0.7),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.gem,
                                  color: Colors.yellowAccent,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "25710",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 18,
                      left: getSize(context) * 20 / 300,
                      right: getSize(context) * 20 / 300,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bu Aya ait sipariş miktarı",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey, fontSize: 15),
                              ),
                              Text(
                                "697.9 K",
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Text(
                                  "Depozito",
                                  style: GoogleFonts.poppins(color: Colors.grey),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.eye,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 32,
                  thickness: 1,
                ),
                Container(
                  height: getSize(context) * 60 / 300,
                  padding: EdgeInsets.symmetric(
                      horizontal: getSize(context) * 20 / 300),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.thumbtack,
                                size: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Beklemeli\nElmas\nSiparişleri",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Text(
                                    "999",
                                    style: GoogleFonts.poppins(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: getSize(context) * 50 / 300,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => SellerOrderPage(
                                    isClickedOrders: 1,
                                  ),
                                ));
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.tasks,
                                size: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Tamamlanan\nSiparişler",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 13),
                                ),
                              ),
                              FaIcon(FontAwesomeIcons.chevronRight, size: 13)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 32,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getSize(context) * 20 / 300),
                  child: InkWell(
                    onTap: () {
                      // settingRepo.currentIndexValueNotifier.value = 1;
                      // Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                      // widget.mainPageViewState.pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.easeInOutExpo);
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SellerOrderPage(),
                          ));
                    },
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      height: getSize(context) * 35 / 300,
                      width: getSize(context),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(1000)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Siparişlerim",
                            style: GoogleFonts.poppins(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.grey.shade700,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: getSize(context) * 35 / 300,
                  width: getSize(context),
                  margin: EdgeInsets.only(
                    top: getSize(context) * 10 / 300,
                    left: getSize(context) * 20 / 300,
                    right: getSize(context) * 20 / 300,
                  ),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(1000)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Kuru Giriniz",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey.shade600, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Onayla", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        color: Colors.green.shade400,
                      )
                    ],
                  ),
                ),
                Container(
                  height: getSize(context) * 35 / 300,
                  width: getSize(context),
                  margin: EdgeInsets.only(
                    top: getSize(context) * 10 / 300,
                    left: getSize(context) * 20 / 300,
                    right: getSize(context) * 20 / 300,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(1000)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bakiye Yükle",
                        style: GoogleFonts.poppins(
                            color: Colors.grey.shade600, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SellerRequestsPage(),
                        ));
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: getSize(context) * 35 / 300,
                    width: getSize(context),
                    margin: EdgeInsets.only(
                      top: getSize(context) * 10 / 300,
                      left: getSize(context) * 20 / 300,
                      right: getSize(context) * 20 / 300,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Talepler",
                          style: GoogleFonts.poppins(
                              color: Colors.grey.shade600, fontSize: 16),
                        ),
                        Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              "13",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => LoginPage(false),
                        ),
                        (route) => false);
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: getSize(context) * 35 / 300,
                    width: getSize(context),
                    margin: EdgeInsets.only(
                      top: getSize(context) * 10 / 300,
                      left: getSize(context) * 20 / 300,
                      right: getSize(context) * 20 / 300,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(1000)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Çıkış Yap",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
