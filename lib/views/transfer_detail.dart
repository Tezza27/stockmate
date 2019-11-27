import 'package:flutter/material.dart';
import 'package:stockmate/models/transfer_detail_card_class.dart';
import 'package:stockmate/templates/transfer_detail_card.dart';
import 'package:stockmate/Settings/colours.dart';

class TransferDetailScreen extends StatefulWidget {
  @override
  _TransferDetailState createState() => new _TransferDetailState();
}

class _TransferDetailState extends State<TransferDetailScreen> {
  List<TransferDetailCardClass> transferDetailCardList =
      const <TransferDetailCardClass>[
    TransferDetailCardClass(
      serial: "123456789",
      sku: "8416581915",
      image: "assets/Sax.jpg",
      productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
      productName: "JP041",
    ),
    TransferDetailCardClass(
      serial: "123456790",
      sku: "8416581915",
      image: "assets/Sax.jpg",
      productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
      productName: "JP041",
    ),
    TransferDetailCardClass(
      serial: "123456791",
      sku: "8416581915",
      image: "assets/Sax.jpg",
      productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
      productName: "JP041",
    ),
    TransferDetailCardClass(
      serial: "123456792",
      sku: "8416581915",
      image: "assets/Sax.jpg",
      productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
      productName: "JP041",
    ),
    TransferDetailCardClass(
      serial: "987654321",
      sku: "8416581915",
      image: "assets/Flute.jpg",
      productDescription: "JP010CH C Flute (Kinder Flute Silver Plate)",
      productName: "JP010CH",
    ),
  ];
  TextEditingController controller = new TextEditingController();
  String dropdownValue = "Product Ascending";
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
          title: Text("Transfer: 0101010101"),
          centerTitle: true,
          actions: <Widget>[
//            IconButton(
//              icon: Icon(
//                Icons.add_circle,
//                color: iconColour,
//              ),
//              iconSize: 48.0,
//              onPressed: () {},
//            ),
          ],
        ),
        body: Container(
          color: backgroundColour,
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
                  "Product Ascending",
                  "Product Descending",
                  "SKU Ascending",
                  "SKU Descending",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, right: 4.0, left: 4.0, bottom: 4.0),
                child: TextField(
                  maxLines: 1,
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 2.0),
                    filled: true,
                    fillColor: textFieldColour,
                    hintText: 'Enter Serial #',
                    labelText: 'Serial # Search',
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
                      itemCount: transferDetailCardList.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "SerialDetailScreen",
                              );
                            },
                            child: TransferDetailCard(
                                transferDetailCard:
                                    transferDetailCardList[index]));
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
