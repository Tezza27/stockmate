import 'package:flutter/material.dart';
import 'package:stockmate/models/sale_card_class.dart';
import 'package:stockmate/templates/sale_card.dart';
import 'package:stockmate/Settings/colours.dart';

class SaleScreen extends StatefulWidget {
  @override
  _SaleState createState() => new _SaleState();
}

class _SaleState extends State<SaleScreen> {
  List<SaleCardClass> saleCardList = const <SaleCardClass>[
    SaleCardClass(
        saleNumber: "0101010101",
        saleDate: "05/11/19",
        itemQuantity: 8,
        saleFrom: "Taylormade Music Australia",
        saleTo: "David Smith",
    ),
    SaleCardClass(
      saleNumber: "0202020202",
      saleDate: "04/11/19",
      itemQuantity: 1,
      saleFrom: "Green Brothers",
      saleTo: "Sarah Green",
    ),
    SaleCardClass(
      saleNumber: "0303030303",
      saleDate: "04/11/19",
      itemQuantity: 7,
      saleFrom: "Taylormade Music Australia",
      saleTo: "Ozwinds Brisbane",
    ),
    SaleCardClass(
      saleNumber: "0404040404",
      saleDate: "03/11/19",
      itemQuantity: 1,
      saleFrom: "Mona vale Music",
      saleTo: "Simon Jones",
    ),
    SaleCardClass(
      saleNumber: "0505050505",
      saleDate: "02/11/19",
      itemQuantity: 34,
      saleFrom: "Taylormade Music Australia",
      saleTo: "Summer Heights High School",
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
          title: Text("Sales"),
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
                  "NewSaleScreen",);},
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
                    "Sale # Ascending",
                    "Sale # Descending"
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
                      hintText: 'Enter Sale #',
                      labelText: 'Sale # Search',
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
                        itemCount: saleCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  "SaleDetailScreen",);},
                              child: SaleCard(
                                  saleCard: saleCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
