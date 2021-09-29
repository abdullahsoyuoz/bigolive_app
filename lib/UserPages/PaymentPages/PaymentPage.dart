import 'package:bigolive_app/MainPageView.dart';
import 'package:bigolive_app/UserPages/AuthPages/LoginPage.dart';
import 'package:bigolive_app/Utility/CustomAppBar.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PaymentPage extends StatefulWidget {
  MainPageViewState mainPageViewState;
  FakeUser user;
  PaymentPage(this.user, {this.mainPageViewState});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  ScrollController _listViewControlller;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _bigoIdController;
  TextEditingController _nameController;
  TextEditingController _surnameController;
  TextEditingController _timeController;
  TextEditingController _descriptionController;
  TextEditingController _bankController;
  TextEditingController _priceController;
  bool priceController = false;
  int dropDownPaymentType;
  bool isInputDekont = false;

  DateTime selectedDate;
  DateTime selectedTime;

  @override
  void initState() {
    super.initState();
    _listViewControlller = ScrollController();
    _bigoIdController = TextEditingController();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _timeController = TextEditingController();
    _descriptionController = TextEditingController();
    _bankController = TextEditingController();
    _priceController = TextEditingController(text: '10');
  }

  @override
  void dispose() {
    super.dispose();
    _listViewControlller.dispose();
    _bigoIdController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _timeController.dispose();
    _descriptionController.dispose();
    _bankController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Ödeme", true),
      bottomNavigationBar: Container(
        width: getSize(context),
        height: getSize(context) * 30/300,
        margin: EdgeInsets.symmetric(
          horizontal: getSize(context) * 20/300,
          vertical: getSize(context) * 10/300,
        ),
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    isInputDekont = !isInputDekont;
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.zero,
                splashColor: Colors.green,
                color: isInputDekont ? Colors.green : Colors.red,
                child: Container(
                  constraints: BoxConstraints(minHeight: getSize(context) * 30/300),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.camera, color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("DEKONT GİRİNİZ", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: getSize(context) * 10/300,),
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(builder: (context, setState) {
                      return _showOnayDialog();
                    },),
                  );
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
                        FaIcon(FontAwesomeIcons.check, color: Colors.white,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("ONAYLA", style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: getSize(context),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            controller: _listViewControlller,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              top: getSize(context) * 20 / 300,
              left: getSize(context) * 20 / 300,
              right: getSize(context) * 20 / 300,
              bottom: 16
            ),
            children: [
              Container(
                width: getSize(context) * 0.85,
                height: getSize(context) * 50 / 300,
                decoration: BoxDecoration(
                    border: Border.all(color: appColorGoldDark, width: 2),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: appColorGoldDark, width: 2),
                            shape: BoxShape.circle),
                        height: getSize(context) * 40 / 300,
                        width: getSize(context) * 40 / 300,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(widget.user.profilePhotoUrl),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "${widget.user.name}",
                          style: GoogleFonts.poppins(
                              color: appColorGoldDark,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
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
                    controller: _bigoIdController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Bigo Kimliği (Yükleme yapılacak kişi)",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                      height: getSize(context) * 40 / 300,
                      width: getSize(context),
                      decoration: BoxDecoration(
                          color: appColorGoldLight.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(getSize(context) * 30 / 300),
                            bottomRight:
                                Radius.circular(getSize(context) * 30 / 300),
                          )),
                      child: Center(
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 32),
                              hintText: "Adınız",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(context) * 10 / 300,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                      height: getSize(context) * 40 / 300,
                      width: getSize(context),
                      decoration: BoxDecoration(
                          color: appColorGoldLight.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(getSize(context) * 30 / 300),
                            bottomRight:
                                Radius.circular(getSize(context) * 30 / 300),
                          )),
                      child: Center(
                        child: TextFormField(
                          controller: _surnameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 32),
                              hintText: "Soyadınız",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            currentTime: DateTime.now(),
                            minTime: DateTime.now(),
                            maxTime: DateTime(2030, 6, 7),
                            locale: LocaleType.tr,
                            onChanged: (date) {

                            },
                            onConfirm: (date) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                        padding: EdgeInsets.symmetric(horizontal: 32,),
                        height: getSize(context) * 40 / 300,
                        width: getSize(context),
                        decoration: BoxDecoration(
                            color: appColorGoldLight.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getSize(context) * 30 / 300),
                              bottomRight: Radius.circular(getSize(context) * 30 / 300),
                            )),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            selectedDate == null ? 'Tarih' : 'Tarih: ${selectedDate.day}:${selectedDate.month}:${selectedDate.year}'
                            , style: selectedDate == null ? GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13) : GoogleFonts.poppins(color: Colors.black, fontSize: 13)),
                        ),
                      ),
                  ),
                  SizedBox(
                    width: getSize(context) * 10 / 300,
                  ),
                  Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        DatePicker.showTimePicker(context,
                            showTitleActions: true,
                            currentTime: DateTime.now(),
                            showSecondsColumn: false,
                            locale: LocaleType.tr,
                            onChanged: (date) {

                            },
                            onConfirm: (date) {
                              setState(() {
                                selectedTime = date;
                              });
                            },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                        padding: EdgeInsets.symmetric(horizontal: 32,),
                        height: getSize(context) * 40 / 300,
                        width: getSize(context),
                        decoration: BoxDecoration(
                            color: appColorGoldLight.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getSize(context) * 30 / 300),
                              bottomRight: Radius.circular(getSize(context) * 30 / 300),
                            )),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            selectedTime == null ? "Saat" : 'Saat: ${selectedTime.hour}:${selectedTime.minute}'
                            , style: selectedTime == null ? GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13) : GoogleFonts.poppins(color: Colors.black, fontSize: 13)),
                        ),
                      ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: getSize(context) * 20 / 300),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      priceController = !priceController;
                    });
                  },
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getSize(context) * 30 / 300),
                    bottomRight: Radius.circular(getSize(context) * 30 / 300),
                  ),
                  splashColor: appColorGoldDark,
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    width: getSize(context),
                    decoration: BoxDecoration(
                        color: appColorGoldLight.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getSize(context) * 30 / 300),
                          bottomRight:
                              Radius.circular(getSize(context) * 30 / 300),
                        )),
                    child: priceController
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tutar",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey.shade600, fontSize: 13)),
                                  FaIcon(FontAwesomeIcons.chevronDown)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: getSize(context) * 60/300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextFormField(
                                        controller: _priceController,
                                        onChanged: (value) {
                                          setState(() {
                                            calculateNewTLPrice(_priceController.text);
                                          });
                                        },
                                        keyboardType: TextInputType.number,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefix: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              child: FaIcon(FontAwesomeIcons.dollarSign, size: 14,),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: FaIcon(FontAwesomeIcons.times, size: 14, color: Colors.grey.shade500),
                                    ),
                                    Text("8.30", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: FaIcon(FontAwesomeIcons.equals, size: 14, color: Colors.grey.shade500,),
                                    ),
                                    Text(calculateNewTLPrice(_priceController.text).toString(), style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: FaIcon(FontAwesomeIcons.equals, size: 14, color: Colors.grey.shade500,),
                                    ),
                                    Text("1000", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: FaIcon(FontAwesomeIcons.gem, size: 18,),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tutar",
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
                              FaIcon(FontAwesomeIcons.chevronDown)
                            ],
                          ),
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
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Açıklama",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
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
                    controller: _bankController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 32),
                        hintText: "Banka",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getSize(context) * 20 / 300),
                height: getSize(context) * 40 / 300,
                width: getSize(context),
                padding: EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                    color: appColorGoldLight.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getSize(context) * 30 / 300),
                      bottomRight: Radius.circular(getSize(context) * 30 / 300),
                    )),
                child: DropdownButton(
                  value: dropDownPaymentType,
                  onChanged: (value) {
                    setState(() {
                      dropDownPaymentType = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(child: Text("Havale"), value: 0,),
                    DropdownMenuItem(child: Text("Bankamatik"), value: 1,),
                  ],
                  dropdownColor: appColorGoldLight,
                  hint: Text("Ödeme Tipi",style: GoogleFonts.poppins(color: Colors.grey.shade600, fontSize: 13)),
                  icon: FaIcon(FontAwesomeIcons.chevronDown),
                  underline: SizedBox(),
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showOnayDialog(){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        width: getSize(context)*0.9,
        height: getSize(context) * 0.7,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [appColorGoldDark, appColorGoldLight],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: appColorGoldDark, width: 2),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("03.00", style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold),),
              )),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("İşleminiz Alındı. Lütfen Bekleyiniz.", style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
                )),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Container(
                    width: getSize(context) * 0.5,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage(true),));
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
                            child: Text("KAYIT OL", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ),),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("veya", style: GoogleFonts.poppins(color: Colors.grey),),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: getSize(context) * 0.5,
                child: RaisedButton(
                  onPressed: () {
                    // print('TEST ${settingRepo.pageViewState.value.pageController!=null ? "NO" : "YES"}');
                    // settingRepo.pageViewState.value.pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.easeInOutExpo);
                    //  FIXME:
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.zero,
                  splashColor: appColorNavyBlueDark,
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [appColorGoldDark, appColorGoldLight]
                        )
                    ),
                    child: Container(
                      constraints: BoxConstraints(minHeight: getSize(context) * 30/300),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("DEVAM ET", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double calculateNewTLPrice(String oldValue) {
  if(oldValue.isEmpty){
    return 0;
  }
    print((double.tryParse(oldValue) * 8.3).toString());
    return double.tryParse(oldValue) * 8.3;
  
}


