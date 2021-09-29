import 'package:bigolive_app/Utility/CustomAppBar.dart';
import 'package:bigolive_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerNewAdministratorPage extends StatefulWidget {
  @override
  _SellerNewAdministratorPageState createState() => _SellerNewAdministratorPageState();
}

class _SellerNewAdministratorPageState extends State<SellerNewAdministratorPage> {
  TextEditingController _bigoId;
  TextEditingController _phoneNumberController;
  TextEditingController _gainRate;
  final _formKey = GlobalKey<FormState>();
  int dropDownValue;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = MaskedTextController(mask: "000 000 00 00");
    _bigoId = TextEditingController();
    _gainRate = MaskedTextController(mask: "00");
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberController.dispose();
    _bigoId.dispose();
    _gainRate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Alt Bayi Ekle", true),
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: 24,
              left: getSize(context) * 20/300,
              right: getSize(context) * 20/300,
            ),
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  controller: _bigoId,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    labelText: "Yönetici BIGO ID",
                    hintText: "Lütfen yöneticinin BIGO ID'sini giriniz"
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      width: getSize(context) * 70/300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton(
                          onChanged: (value) {
                            setState(() {
                              dropDownValue= value;
                            });
                          },
                          items: [
                            DropdownMenuItem(child: Text("+90"))
                          ],
                          value: dropDownValue,
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: FaIcon(FontAwesomeIcons.chevronDown, size: 16,),
                          ),
                          underline: SizedBox(),
                          isExpanded: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            labelText: "Yöneticinin Telefon Numarası",
                            hintText: "Onay kodu için"
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical: 8),
                margin: EdgeInsets.only(bottom: 16),
                child: TextFormField(
                  controller: _gainRate,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      labelText: "Kar Oranı",
                      hintText: ""
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
