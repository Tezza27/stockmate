import 'package:flutter/material.dart';
import 'package:stockmate/models/warranty_card_class.dart';
import 'package:stockmate/templates/warranty_card.dart';
import 'package:stockmate/Settings/colours.dart';

class WarrantyScreen extends StatefulWidget {
  @override
  _WarrantyState createState() => new _WarrantyState();
}

class _WarrantyState extends State<WarrantyScreen> {
  List<WarrantyCardClass> warrantyCardList = const <WarrantyCardClass>[
    WarrantyCardClass(
      warrantyNumber: "0101010101",
      productName: "JP041",
      claimDate: "05/11/19",
      issueDescription: "keys are sticking",
      actionTaken: "Repair",
      warrantyCovered: true,
      currentStatus: "Repairing",
      image: "assets/Sax.jpg",
    ),
    WarrantyCardClass(
      warrantyNumber: "0101010101",
      productName: "JP041",
      claimDate: "04/11/19",
      issueDescription: "Dented neck",
      actionTaken: "Repair",
      warrantyCovered: false,
      currentStatus: "Received",
      image: "assets/Sax.jpg",
    ),

    WarrantyCardClass(
      warrantyNumber: "0101010101",
      productName: "JP041",
      claimDate: "03/11/19",
      issueDescription: "Air leaks",
      actionTaken: "Replaced",
      warrantyCovered: true,
      currentStatus: "Closed",
      image: "assets/Sax.jpg",
    ),
    WarrantyCardClass(
      warrantyNumber: "0101010101",
      productName: "JP041",
      claimDate: "02/11/19",
      issueDescription: "keys are sticking",
      actionTaken: "Repair",
      warrantyCovered: false,
      currentStatus: "Repaired",
      image: "assets/Sax.jpg",
    ),
    WarrantyCardClass(
      warrantyNumber: "0101010101",
      productName: "JP041",
      claimDate: "01/11/19",
      issueDescription: "Neck cork broken",
      actionTaken: "Refund",
      warrantyCovered: true,
      currentStatus: "Closed",
      image: "assets/Sax.jpg",
    ),
  ];
  TextEditingController controller = new TextEditingController();
  String dropdownValue = "Date Descending";
  String filter;

  @override
  void initState() {
    controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("Warranty Claims"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: iconColour,
              ),
              iconSize: 48.0,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "NewWarrantyScreen",
                );
              },
            ),
          ],
        ),
        body: Container(
          color: backgroundColour,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconEnabledColor: iconColour,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String dropdownSelection) {
                    setState(() {
                      dropdownValue = dropdownSelection;
                    });
                  },
                  items: <String>[
                    "Date Ascending",
                    "Date Descending",
                    "Invoice # Ascending",
                    "Invoice # Descending"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 2.0, bottom: 4.0),
                  child: TextField(
                    maxLines: 1,
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 2.0),
                      filled: true,
                      fillColor: textFieldColour,
                      hintText: 'Enter Invoice #',
                      labelText: 'Invoice # Search',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide()),
                      suffixIcon: IconButton(
                        icon: Container(
                          child: Icon(Icons.clear),
                        ),
                        onPressed: () {
                          controller.clear();
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: warrantyCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "WarrantyDetailScreen",
                                );
                              },
                              child: WarrantyCard(
                                  warrantyCard: warrantyCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
