import 'package:bigolive_app/SellerPages/SellerOrderPages/SellerNewAdministratorPage.dart';
import 'package:bigolive_app/Utility/CustomAppBar.dart';
import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart' as mask;

class SellerRequestsPage extends StatefulWidget {
  @override
  _SellerRequestsPageState createState() => _SellerRequestsPageState();
}

class _SellerRequestsPageState extends State<SellerRequestsPage> {
  int selectedCustomerType = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Talepler", true),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 24),
          children: [
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
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedCustomerType = 0;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedCustomerType == 0 ? Colors.grey.shade300 : Colors.grey.shade500,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20)
                                ),
                              ),
                              child: Center(child: Text("Alt Bayiler", style: GoogleFonts.poppins(color: selectedCustomerType == 0 ? Colors.black : Colors.grey.shade400),),)),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedCustomerType = 1;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedCustomerType == 1 ? Colors.grey.shade300 : Colors.grey.shade500,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20)
                                ),
                              ),
                              child: Center(child: Text("Müşteriler", style: GoogleFonts.poppins(color: selectedCustomerType == 1 ? Colors.black : Colors.grey.shade400),),)),
                        ),
                      ),
                    ],
                  ),
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
                  scrollDirection: Axis.vertical,
                  itemCount: (FakeData.userList.length) + 1,
                  itemBuilder: (context, index) {
                    if(index == 0){
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => SellerNewAdministratorPage(),));
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: getSize(context),
                          height: getSize(context) * 60/300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: getSize(context) * 40/300,
                                height: getSize(context) * 40/300,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey, width: 1)
                                ),
                                child: Center(child: FaIcon(FontAwesomeIcons.plus, color: Colors.grey, size: 24)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("Yönetici Ekle", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 22),),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    if(index != 0){
                      FakeUser user = FakeData.userList[index - 1];
                      return CustomerItem(user);
                    }
                    return SizedBox();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomerItem extends StatefulWidget {
  FakeUser user;
  CustomerItem(this.user);
  @override
  _CustomerItemState createState() => _CustomerItemState();
}

class _CustomerItemState extends State<CustomerItem> {
  bool isClicked = false;
  TextEditingController amountController = mask.MaskedTextController(mask: '0000');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context),
      height: isClicked ? getSize(context) * 100/300 : getSize(context) * 50/300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: getSize(context) * 40/300,
                    height: getSize(context) * 40/300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.network(widget.user.profilePhotoUrl,
                        width: getSize(context) * 40/300,
                        height: getSize(context) * 40/300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.user.name}", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
                        Text("${widget.user.bigoId}", style: GoogleFonts.poppins(color: Colors.grey.shade700),),
                      ],
                    ),
                  )
                ],
              ),
              CupertinoSwitch(value: isClicked, onChanged: (value) {
                setState(() {
                  isClicked = value;
                });
              },)
            ],
          ),
          isClicked == false ? SizedBox() :
              InkWell(
                onTap: () {

                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: getSize(context) * 0.5,
                  margin: EdgeInsets.only(top: getSize(context) * 10/300),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FaIcon(FontAwesomeIcons.gem, size: 14,),
                      ),
                      Expanded(child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Miktar'
                        ),
                      )),
                      Text("ONAYLA", style: GoogleFonts.poppins(fontSize: 16),)
                    ],
                  ),
                ),
              )
        ],
      ),
    );
  }
}

