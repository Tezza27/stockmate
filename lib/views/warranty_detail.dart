import 'package:flutter/material.dart';
import 'package:stockmate/models/warranty_detail_card_class.dart';
import 'package:stockmate/templates/warranty_detail_card.dart';
import 'package:stockmate/Settings/colours.dart';

class WarrantyDetailScreen extends StatefulWidget {
  @override
  _WarrantyDetailState createState() => new _WarrantyDetailState();
}

class _WarrantyDetailState extends State<WarrantyDetailScreen> {
  List<WarrantyDetailCardClass> warrantyDetailCardList =
  const <WarrantyDetailCardClass>[

    WarrantyDetailCardClass(
      noteDate: "012/11/19",
      noteStatus: "Closed",
      noteDetail: "Saxaphone has been collected by customer.",
    ),
    WarrantyDetailCardClass(
      noteDate: "011/11/19",
      noteStatus: "Collectable",
      noteDetail: "Customer has been advise that her saxaphone is repaired and available for collection from the Brisbane Warehouse.  She intends to collect it on 12/11/19",
    ),
    WarrantyDetailCardClass(
      noteDate: "011/11/19",
      noteStatus: "Repaired",
      noteDetail: "Saxaphone has been repaired and received by the Brisbane Warehouse.",
    ),
    WarrantyDetailCardClass(
      noteDate: "03/11/19",
      noteStatus: "Repairing",
      noteDetail: "Saxaphone has been sent to manufacturer for repair",
    ),
    WarrantyDetailCardClass(
      noteDate: "03/11/19",
      noteStatus: "Received",
      noteDetail: "Customer delivered saxaphone",
    ),
  WarrantyDetailCardClass(
  noteDate: "01/11/19",
  noteStatus: "Raised",
  noteDetail: "Customer called to describe fault and was advised to drop the saxaphone into the Brisbane Warehouse.  Customer advises that it will be delivered on 03/11/19",
  ),


  ];
  TextEditingController controller = new TextEditingController();
  String dropdownValue = "Date Descending";
  String filter;
  String customerButtonText = "SHOW CUSTOMER DETAILS";
  bool showCustomer = false;
  bool customerVisibility = false;

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
          title: Text("Claim 111111111"),
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
                  "NoteScreen",
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
                    Positioned(
                      right: 12.0,
                      top: 12.0,
                      child: Container(
                        child: warrantyCovered(true),
                      ),
                    ),
                  ],
                ),

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

                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                        itemCount: warrantyDetailCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  "SerialListScreen",);},
                              child: WarrantyDetailCard(
                                  warrantyDetailCard: warrantyDetailCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  Icon warrantyCovered(bool warrantyCovered){
    Icon myIcon;
    if (warrantyCovered){
      myIcon = Icon(Icons.check_circle, size: 40.0, color: iconTickColour,);
    } else{
      myIcon = Icon(Icons.cancel, size: 40.0, color: iconCrossColour,);
    }

    return myIcon;
  }
}
