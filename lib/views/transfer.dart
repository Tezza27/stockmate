import 'package:flutter/material.dart';
import 'package:stockmate/models/transfer_card_class.dart';
import 'package:stockmate/templates/transfer_card.dart';
import 'package:stockmate/Settings/colours.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferState createState() => new _TransferState();
}

class _TransferState extends State<TransferScreen> {
  List<TransferCardClass> transferCardList = const <TransferCardClass>[
    TransferCardClass(
        transferNumber: "0101010101",
        transferDate: "01/11/19",
        transferFrom: "Brisbane Warehouse",
        transferTo: "Presto Music",
        itemQuantity: 5),
    TransferCardClass(
        transferNumber: "0202020202",
        transferDate: "02/11/19",
        transferFrom: "Ozwinds Melbourne",
        transferTo: "Woods Wind & Brass",
        itemQuantity: 2),
    TransferCardClass(
        transferNumber: "0303030303",
        transferDate: "03/11/19",
        transferFrom: "Mona Vale Music",
        transferTo: "Green Brothers",
        itemQuantity: 1),
    TransferCardClass(
        transferNumber: "0404040404",
        transferDate: "04/11/19",
        transferFrom: "Brisbane Warehouse",
        transferTo: "Ozwind Gold Coast",
        itemQuantity: 5),
    TransferCardClass(
        transferNumber: "0101010101",
        transferDate: "05/11/19",
        transferFrom: "Brisbane Warehouse",
        transferTo: "Presto Music",
        itemQuantity: 5),
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
          title: Text("Transfers"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: iconColour,
              ),
              iconSize: 48.0,
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  "NewTransferScreen",);},
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
                    "Transfer # Ascending",
                    "Transfer # Descending"
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
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                      filled: true,
                      fillColor: textFieldColour,
                      hintText: 'Enter Transfer #',
                      labelText: 'Transfer # Search',
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
                        itemCount: transferCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  "TransferDetailScreen",);},
                              child: TransferCard(
                                  transferCard: transferCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
