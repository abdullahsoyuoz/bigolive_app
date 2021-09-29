import 'package:bigolive_app/MainPageView.dart';
import 'package:bigolive_app/SellerPages/SellerAuthPages/SellerLoginPage.dart';
import 'package:bigolive_app/Utility/CustomAppBar.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class LoginPage extends StatefulWidget {
  bool isHaveBackButton;
  LoginPage(this.isHaveBackButton);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool areYouMember = false;  // true login - false signUp
  final _formKey = GlobalKey<FormState>();
  ScrollController _listViewController;
  TextEditingController _nameController;
  TextEditingController _surnameController;
  TextEditingController _phoneNumberController;
  TextEditingController _passwordController;
  TextEditingController _passwordAgainController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _phoneNumberController = MaskedTextController(mask: '0000000000');
    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(areYouMember ? 'Kayıt Ol' : 'Giriş Yap', widget.isHaveBackButton),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            controller: _listViewController,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              top: getSize(context) * 20 / 300,
              left: getSize(context) * 20 / 300,
              right: getSize(context) * 20 / 300,
              bottom: 16
            ),
            children: [
              areYouMember == false ? SizedBox() : Container(
                margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                height: getSize(context) * 40 / 300,
                width: getSize(context),
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(context) * 30 / 300),
                      bottomRight: Radius.circular(getSize(context) * 30 / 300),
                    )),
                child: Center(
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Adınız",
                        hintStyle: TextStyle(color: Colors.grey.shade600)),
                  ),
                ),
              ),
              areYouMember == false ? SizedBox() : Container(
                margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                height: getSize(context) * 40 / 300,
                width: getSize(context),
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(context) * 30 / 300),
                      bottomRight: Radius.circular(getSize(context) * 30 / 300),
                    )),
                child: Center(
                  child: TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Soyadınız",
                        hintStyle: TextStyle(color: Colors.grey.shade600)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                height: getSize(context) * 40 / 300,
                width: getSize(context),
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(context) * 30 / 300),
                      bottomRight: Radius.circular(getSize(context) * 30 / 300),
                    )),
                child: Center(
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixText: "(+90) ",
                        hintText: "Telefon numaranız",
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintStyle: TextStyle(color: Colors.grey.shade600)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                height: getSize(context) * 40 / 300,
                width: getSize(context),
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(context) * 30 / 300),
                      bottomRight: Radius.circular(getSize(context) * 30 / 300),
                    )),
                child: Center(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Parolanız",
                        hintStyle: TextStyle(color: Colors.grey.shade600)),
                  ),
                ),
              ),
              areYouMember == false ? SizedBox() : Container(
                margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                height: getSize(context) * 40 / 300,
                width: getSize(context),
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(context) * 30 / 300),
                      bottomRight: Radius.circular(getSize(context) * 30 / 300),
                    )),
                child: Center(
                  child: TextFormField(
                    controller: _passwordAgainController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Parolanızı doğrulayınız",
                        hintStyle: TextStyle(color: Colors.grey.shade600)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Henüz kayıt olmadınız mı?", style: GoogleFonts.poppins(fontSize: 16),),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: CupertinoSwitch(
                        value: areYouMember,
                        activeColor: appColorGoldLight,
                        onChanged: (value) {
                          setState(() {
                            areYouMember = !areYouMember;
                          });
                      },),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      vertical: 40
                    ),
                    child: Text("veya"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Center(child: FaIcon(FontAwesomeIcons.facebookF, color: Color.fromARGB(255, 66, 103, 178), size: 32,))),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Center(child: FaIcon(FontAwesomeIcons.twitter, color: Color.fromARGB(255, 29, 161, 242), size: 32,))),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: Center(child: FaIcon(FontAwesomeIcons.google, color: Color.fromARGB(255, 219, 68, 55), size: 32,))),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Align(alignment: Alignment.center, child: Text("hesaplarınız ile hızlıca giriş yapabilirsiniz.", style: GoogleFonts.poppins(fontSize: 15),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: RaisedButton(
                  onPressed: () {
                    if(areYouMember){
                      // login TODOs
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                    }
                    {
                      // signUp TODOs
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                    }
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(areYouMember ? "KAYIT OL" : "GİRİŞ YAP", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.zero,
                  splashColor: appColorNavyBlueDark,
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [Colors.green.shade100, Colors.green.shade400]
                        )
                    ),
                    child: Container(
                      constraints: BoxConstraints(minHeight: getSize(context) * 30/300),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("MİSAFİR OLARAK DEVAM ET", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SellerLoginPage(),));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.zero,
                  splashColor: appColorGoldDark,
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [appColorBrownLight, appColorBrownDark]
                        )
                    ),
                    child: Container(
                      constraints: BoxConstraints(minHeight: getSize(context) * 30/300),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("BAYİ GİRİŞİ", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
