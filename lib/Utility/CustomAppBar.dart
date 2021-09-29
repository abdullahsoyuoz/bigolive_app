import 'package:bigolive_app/Utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends PreferredSize{
  String title;
  bool isBackButtonHave;
  CustomAppBar(this.title, this.isBackButtonHave);
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(preferredSize.height * 2),
      ),
      child: Container(
        height: preferredSize.height * 2,
        padding: EdgeInsets.only(top: preferredSize.height * 0.5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [appColorGoldLight, appColorGoldDark],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(preferredSize.height * 2),
            )
        ),
        child: Stack(
          children: [
            Center(child: Text(title, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)),
            isBackButtonHave ? Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.white,),
                ),
              ),
            ) : SizedBox()
          ],
        ),
      ),
    );
  }
}