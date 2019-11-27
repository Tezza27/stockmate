import 'package:flutter/material.dart';
import 'package:stockmate/models/delivery_detail_card_class.dart';
import 'package:stockmate/templates/delivery_detail_card.dart';
import 'package:stockmate/Settings/colours.dart';

class NewDeliveryScreen extends StatefulWidget {
  @override
  _NewDeliveryState createState() => new _NewDeliveryState();
}

class _NewDeliveryState extends State<NewDeliveryScreen> {
  List<DeliveryDetailCardClass> deliveryDetailCardList =
      const <DeliveryDetailCardClass>[
    DeliveryDetailCardClass(
      productName: "JP010CH",
      sku: "25616516",
      productDescription: "JP010CH C Flute (Kinder Flute Silver Plate)",
      quantity: 4,
      image: "assets/Flute.jpg",
    ),
    DeliveryDetailCardClass(
      productName: "JP041",
      sku: "8416581915",
      productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
      quantity: 11,
      image: "assets/Sax.jpg",
    ),
    DeliveryDetailCardClass(
      productName: "JP051",
      sku: "465191651",
      productDescription: "JP051 Bb Trumpet (Lacquer with Rose Brass Leadpipe)",
      quantity: 7,
      image: "assets/Trumpet.jpg",
    ),
    DeliveryDetailCardClass(
      productName: "pCornet",
      sku: "995191664",
      productDescription:
          "pCornet is the world’s first ever fully plastic cornet – based on the traditional British Shepherd’s crook Bb cornet.",
      quantity: 18,
      image: "assets/Cornet.png",
    ),
  ];
  String dropdownValue = "Product Ascending";
  String filter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("New Delivery"),
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
                      const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 4.0),
                  child: RaisedButton(
                    color: buttonColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColour)),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "DeliveryScreen",
                      );
                    },
                    child: Text(
                      "DONE",
                      style: TextStyle(color: borderColour),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: deliveryDetailCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: () {},
                              child: DeliveryDetailCard(
                                  deliveryDetailCard:
                                      deliveryDetailCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
