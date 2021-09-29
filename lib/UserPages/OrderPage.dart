import 'package:bigolive_app/Utility/FakeData.dart';
import 'package:bigolive_app/Utility/colors.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
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
                    FakeOrder order = FakeData.orderList[index];
                    return buildOrderItem(context, order);
                  },
                ),
              ),
            )
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
