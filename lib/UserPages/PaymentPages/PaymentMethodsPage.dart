import 'package:bigolive_app/UserPages/PaymentPages/PaymentPage.dart';
import 'package:bigolive_app/Utility/CustomAppBar.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsPage extends StatefulWidget {
  FakeUser user;
  PaymentMethodsPage(this.user);

  @override
  _PaymentMethodsPageState createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  ScrollController _listViewController;

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
      appBar: CustomAppBar("Ödeme Yöntemleri", true),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  controller: _listViewController,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    top: getSize(context) * 20/300,
                    left: getSize(context) * 20/300,
                    right: getSize(context) * 20/300,
                  ),
                  itemCount: FakeData.bankList.length,
                  itemBuilder: (context, index) {
                    FakeBankIban item = FakeData.bankList[index];
                    return buildPaymentItem(context, item);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getSize(context) * 20/300,
                bottom: getSize(context) * 30/300,
                left: getSize(context) * 20/300,
                right: getSize(context) * 20/300,
              ),
              child: Container(
                width: getSize(context),
                height: getSize(context) * 30/300,
                color: Colors.transparent,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => PaymentPage(widget.user),));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.zero,
                  splashColor: appColorNavyBlueDark,
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [appColorNavyBlueLight, appColorNavyBlueDark]
                      )
                    ),
                    child: Container(
                      constraints: BoxConstraints(minHeight: getSize(context) * 30/300),
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.check, color: Colors.white, size: 16,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("ONAYLA", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaymentItem(BuildContext context, FakeBankIban item) {
    return Container(
      width: getSize(context),
      margin: EdgeInsets.only(
        bottom: getSize(context) * 20/300
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(FontAwesomeIcons.university),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(item.title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(appSnackBar);
            },
            color: Colors.grey.shade100,
            splashColor: Colors.grey.shade200,
            child: Row(
              children: [
                
                Expanded(child: Text("TR ${item.iban}", style: TextStyle(fontSize: 14),)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FaIcon(FontAwesomeIcons.copy, color: Colors.grey.shade400),
                ),
              ],
            ),
          )
        ],
      ));
  }

  final appSnackBar = SnackBar(
    content: Text("IBAN kopyalandı"),
    backgroundColor: Colors.black87,
    duration: Duration(milliseconds: 1500),
  );
}
