import 'package:bigolive_app/MainPageView.dart';
import 'package:bigolive_app/UserPages/AuthPages/LoginPage.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  MainPageViewState mainPageViewState;
  FakeUser user;
  bool isMyPage;
  ProfilePage(this.user, {this.mainPageViewState, this.isMyPage = true});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top * 0.5),
        child: Stack(
          children: [
            // DESING
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: getSize(context) * 0.95,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    bottomLeft: Radius.circular(150),
                  )
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: getSize(context) * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(130),
                      bottomLeft: Radius.circular(130),
                    )
                ),
              ),
            ),
            // DESIGN
            Center(
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  CircleAvatar(
                    radius: widget.isMyPage ? getSize(context) * 40/300 : getSize(context) * 45/300,
                    backgroundColor: widget.user.isOnline ? Colors.green : Colors.red,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.network(widget.user.profilePhotoUrl,
                          width: getSize(context) * 80/300,
                          height: getSize(context) * 80/300,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: RichText(
                        text: TextSpan(
                            text: "ID: ",
                            style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                            children: [
                              TextSpan(
                                text: "${widget.user.bigoId.toInt()}",
                                style: GoogleFonts.poppins(color: Colors.grey.shade800, fontSize: 16)
                              )]),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text("10.000", style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Container(
                        width: getSize(context) * 100/300,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Text("100", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: FaIcon(FontAwesomeIcons.gem, size: 18, color: Colors.yellowAccent,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getSize(context) * 160/300,
                      margin: EdgeInsets.only(top: 48),
                      child: FlatButton(
                        onPressed: (){
                          widget.mainPageViewState.pageController.animateToPage(0, duration: Duration(milliseconds: 100), curve: Curves.easeInOutExpo);
                        },
                        child: Center(child: Text("ÇEKİM TALEBİ VER"),),
                        color: appColorNavyBlueLight,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getSize(context) * 160/300,
                      margin: EdgeInsets.only(top: 12),
                      child: FlatButton(
                        onPressed: (){
                          widget.mainPageViewState.pageController.animateToPage(1, duration: Duration(milliseconds: 100), curve: Curves.easeInOutExpo);
                        },
                        child: Center(child: Text("SİPARİŞLERİME GİT"),),
                        color: appColorGoldLight,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Container(
                        width: getSize(context) * 0.8,
                        height: getSize(context) * 30/300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20)
                          ),
                        ),
                        child: Center(child: Text("Siparişlerim"),),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getSize(context) * 0.8,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 50),
                        itemCount: FakeData.orderList.length,
                        itemBuilder: (context, index) {
                          if(FakeData.orderList[index].orderStatus == 0){
                            FakeOrder order = FakeData.orderList[index];
                            return buildOrderItem(context, order);
                          }
                          else return SizedBox();
                        },
                      ),
                    ),
                  ),
                  !widget.isMyPage ? SizedBox() : Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: FlatButton(
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => LoginPage(false),), (route) => false);
                          },
                          child: Center(child: Text("ÇIKIŞ YAP", style: GoogleFonts.poppins(color: Colors.white),),),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: widget.isMyPage ? SizedBox() : BackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ), //BackButton
          ],
        )
      ),
    );
  }

  buildOrderItem(BuildContext context, FakeOrder order){
    return Container(
      width: getSize(context) * 0.8,
      height: getSize(context) * 100/300,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 5),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, offset: Offset(3,3), blurRadius: 5),
          ]
      ),
      padding: EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
        bottom: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: getSize(context) * 20/300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(order.user.profilePhotoUrl,
                        width: getSize(context) * 40/300,
                        height: getSize(context) * 40/300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${order.user.name}", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
                        Text("Bigo ID: ${order.user.bigoId.toInt()}", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.gem, size: 16,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text("${order.itemCount}", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                    Text("\$ ${order.price}", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),),
                  ],
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${order.date}", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),),
              Container(
                width: getSize(context) * 120/300,
                height: getSize(context) * 30/300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors:
                      order.orderStatus == 0 ? [appColorGoldDark, appColorGoldLight] :
                      order.orderStatus == 1 ? [appColorBrownDark, appColorBrownLight] :
                      order.orderStatus == 2 ? [appColorNavyBlueDark, appColorNavyBlueLight] : [Colors.white, Colors.white]

                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: PopupMenuButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          order.orderStatus == 0 ? "BEKLEMEDE"  :
                          order.orderStatus == 1 ? "İŞLEME ALINDI"  :
                          order.orderStatus == 2 ? "İŞLEM ONAYLANDI" :
                          "Hata", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FaIcon(FontAwesomeIcons.chevronDown, color: Colors.black, size: 18,),
                        ),
                      ],
                    ),
                    itemBuilder: (context) {
                      return List.generate(3, (index){
                        return PopupMenuItem(
                          child: Text("test" + index.toString()),
                        );
                      });
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
