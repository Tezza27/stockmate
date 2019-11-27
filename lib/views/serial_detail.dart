import 'package:flutter/material.dart';
import 'package:stockmate/models/warranty_card_class.dart';
import 'package:stockmate/templates/movement_card.dart';
import 'package:stockmate/models/movement_card_class.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/templates/warranty_card.dart';

class SerialDetailScreen extends StatefulWidget {
  @override
  _SerialDetailState createState() => new _SerialDetailState();
}

class _SerialDetailState extends State<SerialDetailScreen> {
  List<MovementCardClass> movementCardList = const <MovementCardClass>[
    MovementCardClass(
      movementType: "Sold",
      docketNumber: "1111111111",
      movementDate: "18/11/19",
      movementTo: "David Smith",
    ),
    MovementCardClass(
      movementType: "Transfer",
      docketNumber: "1414141414",
      movementDate: "17/11/19",
      movementTo: "Ozwinds Brisbane",
    ),
    MovementCardClass(
      movementType: "Transfer",
      docketNumber: "1313131313",
      movementDate: "15/11/19",
      movementTo: "Ozwinds Gold Coast",
    ),
    MovementCardClass(
      movementType: "Delivery",
      docketNumber: "1010101010",
      movementDate: "01/11/19",
      movementTo: "Taylormade Music Australia",
    ),
  ];
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

  ];
  TextEditingController controller = new TextEditingController();
  String filter;
  String customerButtonText = "SHOW CUSTOMER DETAILS";
  bool customerVisibility = false;
  String movementButtonText = "SHOW MOVEMENT HISTORY";
  bool movementVisibility = false;
  String repairButtonText = "SHOW REPAIR HISTORY";
  bool repairVisibility = false;

  @override
  void initState() {
    controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      appBar: AppBar(
        backgroundColor: appBarColour,
        title: Text("Serial: 123456789"),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image(
                        image: AssetImage("assets/Sax.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: backgroundFadeColour,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "JP041 Eb Alto Saxophone (Lacquer)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Product: JP041",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "SKU: 8416581915",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text(
                  "Location: Sold",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Date: 01/11/19",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 0.0, left: 4.0, right: 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: buttonColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColour)),
                    onPressed: () {
                      setState(() {
                        if (customerVisibility) {
                          customerButtonText = "SHOW CUSTOMER DETAILS";
                        } else {
                          customerButtonText = "HIDE CUSTOMER DETAILS";
                        }
                        customerVisibility = !customerVisibility;
                      });
                    },
                    child: Text(
                      customerButtonText,
                      style: TextStyle(color: borderColour),
                    ),
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 0.0, left: 4.0, right: 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: buttonColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColour)),
                    onPressed: () {
                      setState(() {
                        if (movementVisibility) {
                          movementButtonText = "SHOW MOVEMENT HISTORY";
                        } else {
                          movementButtonText = "HIDE MOVEMENT HISTORY";
                        }
                        movementVisibility = !movementVisibility;
                      });
                    },
                    child: Text(
                      movementButtonText,
                      style: TextStyle(color: borderColour),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: movementVisibility,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: movementCardList.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "DeliveryDetailScreen",
                            );
                          },
                          child: MovementCard(
                              movementCard: movementCardList[index]));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 0.0, left: 4.0, right: 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: buttonColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: borderColour)),
                    onPressed: () {
                      setState(() {
                        if (repairVisibility) {
                          repairButtonText = "SHOW REPAIR HISTORY";
                        } else {
                          repairButtonText = "HIDE REPAIR HISTORY";
                        }
                        repairVisibility = !repairVisibility;
                      });
                    },
                    child: Text(
                      repairButtonText,
                      style: TextStyle(color: borderColour),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: repairVisibility,
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
            ],
          ),
        ),
      ),
    );
  }
}
