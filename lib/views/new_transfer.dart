import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockmate/models/transfer_detail_card_class.dart';
import 'package:stockmate/templates/transfer_detail_card.dart';
import 'package:stockmate/Settings/colours.dart';

class NewTransferScreen extends StatefulWidget {
  @override
  _NewTransferState createState() => new _NewTransferState();
}

class _NewTransferState extends State<NewTransferScreen> {
  List<TransferDetailCardClass> transferDetailCardList =
      const <TransferDetailCardClass>[
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
        TransferDetailCardClass(
          serial: "123456793",
          sku: "8416581915",
          image: "assets/Sax.jpg",
          productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
          productName: "JP041",
        ),
        TransferDetailCardClass(
          serial: "987654322",
          sku: "8416581915",
          image: "assets/Flute.jpg",
          productDescription: "JP010CH C Flute (Kinder Flute Silver Plate)",
          productName: "JP010CH",
        ),
  ];
  TextEditingController controller = new TextEditingController();
  String fromDropdownValue = "";
  String toDropdownValue = "";
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
          title: Text("New Transfer"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: iconColour,
              ),
              iconSize: 48.0,
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: backgroundColour,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 2.0, left: 2.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: TextField(
                            maxLines: 1,
                            controller: controller,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 2.0),
                              filled: true,
                              fillColor: textFieldColour,
                              hintText: 'Enter Transfer Number',
                              labelText: 'Transfer Number',
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
                      ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: buttonColour,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: borderColour)),
                          onPressed: () {
                            controller.clear();
                            Navigator.pushNamed(
                              context,
                              "TransferScreen",
                            );
                          },
                          child: Text(
                            "DONE",
                            style: TextStyle(color: borderColour),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "From: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: DropdownButton<String>(
                          value: fromDropdownValue,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconEnabledColor: iconColour,
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String fromDropdownSelection) {
                            setState(() {
                              fromDropdownValue = fromDropdownSelection;
                            });
                          },
                          items: <String>[
                            "",
                            "Brass Music Specialists",
                            "Concept Musical Instruments",
                            "Engadine Music",
                            "Green Brothers",
                            "Taylormade Music Australia"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "To: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: DropdownButton<String>(
                          value: toDropdownValue,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          iconEnabledColor: iconColour,
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String toDropdownSelection) {
                            setState(() {
                              toDropdownValue = toDropdownSelection;
                            });
                          },
                          items: <String>[
                            "",
                            "Brass Music Specialists",
                            "Concept Musical Instruments",
                            "Engadine Music",
                            "Green Brothers",
                            "Taylormade Music Australia"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
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
                              onTap: () {},
                              child: TransferDetailCard(
                                  transferDetailCard:
                                      transferDetailCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
