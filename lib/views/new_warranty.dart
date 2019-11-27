import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';

class NewWarrantyScreen extends StatefulWidget {
  @override
  _NewWarrantyState createState() => new _NewWarrantyState();
}

class _NewWarrantyState extends State<NewWarrantyScreen> {
  TextEditingController serialController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  String actionDropdownValue = "Repair";
  String coveredDropdownValue = "Yes";
  String statusDropdownValue = "Raised";
  String customerButtonText = "SHOW CUSTOMER DETAILS";
  bool showCustomer = false;
  bool customerVisibility = false;

  @override
  void initState() {
    //controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColour,
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("New Claim"),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: TextField(
                            maxLines: 1,
                            controller: serialController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 2.0),
                              filled: true,
                              fillColor: textFieldColour,
                              hintText: 'Enter Serial Number',
                              labelText: 'Enter Serial Number',
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide()),
                              suffixIcon: IconButton(
                                icon: Container(
                                  child: Icon(Icons.clear),
                                ),
                                onPressed: () {
                                  serialController.clear();
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
                            serialController.clear();
                            Navigator.pushNamed(
                              context,
                              "WarrantyScreen",
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
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 2.0,
                  ),
                  child: Text("JP041 Eb Alto Saxophone (Lacquer)"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 2.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Product: JP010CH"),
                      Text("SKU: 25616516"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    DropdownButton<String>(
                      value: actionDropdownValue,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      iconEnabledColor: iconColour,
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String actionDropdownSelection) {
                        setState(() {
                          actionDropdownValue = actionDropdownSelection;
                        });
                      },
                      items: <String>[
                        "Refund",
                        "Repair",
                        "Replace",
                        "No Action",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      value: coveredDropdownValue,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      iconEnabledColor: iconColour,
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String coveredDropdownSelection) {
                        setState(() {
                          coveredDropdownValue = coveredDropdownSelection;
                        });
                      },
                      items: <String>[
                        "No",
                        "Yes",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      value: statusDropdownValue,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      iconEnabledColor: iconColour,
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String statusDropdownSelection) {
                        setState(() {
                          statusDropdownValue = statusDropdownSelection;
                        });
                      },
                      items: <String>[
                        "Raised",
                        "Received",
                        "Repairing",
                        "Repaired",
                        "Collectable",
                        "Send to Customer",
                        "Closed",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
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
                Visibility(
                  visible: customerVisibility,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2.0, bottom: 8.0, left: 4.0, right: 4.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 2.0, left: 4.0, right: 4.0),
                  child: TextField(
                    maxLines: 1,
                    controller: descriptionController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 2.0),
                      filled: true,
                      fillColor: textFieldColour,
                      hintText: 'Enter Description of Issue',
                      labelText: 'Description of Issue',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide()),
                      suffixIcon: IconButton(
                        icon: Container(
                          child: Icon(Icons.clear),
                        ),
                        onPressed: () {
                          descriptionController.clear();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 2.0, left: 4.0, right: 4.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 300.0,
                    child: TextField(
                      //expands: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      minLines: null,
                      controller: noteController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Enter Notes',
                        labelText: 'Notes',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            noteController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
