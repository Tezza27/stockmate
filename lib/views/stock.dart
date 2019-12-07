import 'package:flutter/material.dart';
import 'package:stockmate/models/stock_card_class.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/services/database.dart';
import 'package:provider/provider.dart';
import 'package:stockmate/lists/product_list.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockState createState() => new _StockState();
}

class _StockState extends State<StockScreen> {
//  List<StockCardClass> stockCardList = const <StockCardClass>[
//    StockCardClass(
//      productName: "JP010CH",
//      sku: "25616516",
//      productDescription: "JP010CH C Flute (Kinder Flute Silver Plate)",
//      tmaQuantity: 23,
//      agentQuantity: 8,
//      image: "assets/Flute.jpg",
//    ),
//    StockCardClass(
//      productName: "JP041",
//      sku: "8416581915",
//      productDescription: "JP041 Eb Alto Saxophone (Lacquer)",
//      tmaQuantity: 0,
//      agentQuantity: 4,
//      image: "assets/Sax.jpg",
//    ),
//    StockCardClass(
//      productName: "JP051",
//      sku: "465191651",
//      productDescription: "JP051 Bb Trumpet (Lacquer with Rose Brass Leadpipe)",
//      tmaQuantity: 18,
//      agentQuantity: 1,
//      image: "assets/Trumpet.jpg",
//    ),
//    StockCardClass(
//      productName: "pCornet",
//      sku: "995191664",
//      productDescription:
//          "Fully plastic cornet – based on the traditional British Shepherd’s crook Bb cornet.",
//      tmaQuantity: 1,
//      agentQuantity: 1,
//      image: "assets/Cornet.png",
//    ),
//  ];
  TextEditingController controller = new TextEditingController();
  String dropdownValue = "Product Ascending";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<StockCardClass>>.value(
      value: DatabaseService().products,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColour,
            title: Text("Stock"),
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
                    "NewProductScreen",
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
                      child: ProductList(),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
