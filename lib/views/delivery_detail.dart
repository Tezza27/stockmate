import 'package:flutter/material.dart';
import 'package:stockmate/models/delivery_detail_card_class.dart';
import 'package:stockmate/templates/delivery_detail_card.dart';
import 'package:stockmate/Settings/colours.dart';

class DeliveryDetailScreen extends StatefulWidget {
  @override
  _DeliveryDetailState createState() => new _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetailScreen> {
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
          productDescription: "pCornet is the world’s first ever fully plastic cornet – based on the traditional British Shepherd’s crook Bb cornet.",
          quantity: 18,
          image: "assets/Cornet.png",
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
          title: Text("Invoice 111111111"),
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
                    "Product Ascending",
                    "Product Descending",
                    "SKU Ascending",
                    "SKU Descending"
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
                      hintText: 'Enter SKU #',
                      labelText: 'SKU Search',
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
                        itemCount: deliveryDetailCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  "SerialListScreen",);},
                              child: DeliveryDetailCard(
                                  deliveryDetailCard: deliveryDetailCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
