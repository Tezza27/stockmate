import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockmate/models/delivery_detail_card_class.dart';
import 'package:stockmate/templates/delivery_detail_card.dart';
import 'package:stockmate/Settings/colours.dart';

class NewSaleScreen extends StatefulWidget {
  @override
  _NewSaleState createState() => new _NewSaleState();
}

class _NewSaleState extends State<NewSaleScreen> {
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
  TextEditingController salesNumberController = new TextEditingController();
  String dropdownValue = "Product Ascending";
  String customerButtonText = "SHOW CUSTOMER DETAILS";
  bool customerVisibility = false;

  @override
  void initState() {
    //controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("New Sale"),
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
                      salesNumberController.clear();
                      Navigator.pushNamed(
                        context,
                        "SaleScreen",
                      );
                    },
                    child: Text(
                      "DONE",
                      style: TextStyle(color: borderColour),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: buttonColour,
                    elevation: 16.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColour)),
                    onPressed: () {
                        setState(() {
                          if (customerVisibility){
                            customerButtonText = "SHOW CUSTOMER DETAILS";
                          } else{
                            customerButtonText = "HIDE CUSTOMER DETAILS";
                          }
                          customerVisibility = !customerVisibility;

                        });
                      } ,
                    child: Text(
                      customerButtonText,
                      style: TextStyle(color: borderColour),
                    ),
                  ),
                ),

                Visibility(
                  visible: customerVisibility,
                  child: Container(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Name: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Organisation: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Address: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "City/Town: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "State: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Postcode: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Telephone: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Mobile: ",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Email: ",
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "David Smith",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Summer Heights High School",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "108 Gray Street",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Carina",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Brisbane",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "QLD",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "4152",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "07555555",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Mobile: 07555555555",
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "dsmith@summerheightshigh@ac.au",
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: iconColour,
                            ),
                            iconSize: 24.0,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "CustomerDetailsScreen",
                              );
                            },
                          ),

                        ),
                      ],
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
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "SerialListScreen",
                                );
                              },
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
