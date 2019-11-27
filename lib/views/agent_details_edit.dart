import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';

class AgentDetailsScreen extends StatefulWidget {
  @override
  _AgentDetailsState createState() => new _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetailsScreen> {
  String dropdownValue = "ACT";
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController organisationController = new TextEditingController();
  TextEditingController address1Controller = new TextEditingController();
  TextEditingController address2Controller = new TextEditingController();
  TextEditingController address3Controller = new TextEditingController();
  TextEditingController townController = new TextEditingController();
  TextEditingController postcodeController = new TextEditingController();
  TextEditingController telephoneController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColour,
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("New Agent Details"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 2.0,
                            ),
                            child: TextField(
                              maxLines: 1,
                              controller: firstNameController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 2.0),
                                filled: true,
                                fillColor: textFieldColour,
                                hintText: 'First Name',
                                labelText: 'First Name',
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide()),
                                suffixIcon: IconButton(
                                  icon: Container(
                                    child: Icon(Icons.clear),
                                  ),
                                  onPressed: () {
                                    firstNameController.clear();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 2.0,
                            ),
                            child: TextField(
                              maxLines: 1,
                              controller: lastNameController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 2.0),
                                filled: true,
                                fillColor: textFieldColour,
                                hintText: 'Last Name',
                                labelText: 'Last Name',
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide()),
                                suffixIcon: IconButton(
                                  icon: Container(
                                    child: Icon(Icons.clear),
                                  ),
                                  onPressed: () {
                                    lastNameController.clear();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: organisationController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Organisation',
                        labelText: 'Organisation',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            organisationController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: address1Controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Address 1',
                        labelText: 'Address 1',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            address1Controller.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: address2Controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Address 2',
                        labelText: 'Address 2',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            address2Controller.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: townController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'City or Town',
                        labelText: 'City or Town',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            townController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: DropdownButton<String>(
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
                              "ACT",
                              "NSW",
                              "NT",
                              "QLD",
                              "SA",
                              "TAS",
                              "VIC",
                              "WA",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: TextField(
                            maxLines: 1,
                            controller: postcodeController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 2.0),
                              filled: true,
                              fillColor: textFieldColour,
                              hintText: 'Postcode',
                              labelText: 'Postcode',
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide()),
                              suffixIcon: IconButton(
                                icon: Container(
                                  child: Icon(Icons.clear),
                                ),
                                onPressed: () {
                                  postcodeController.clear();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: telephoneController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Telephone Number',
                        labelText: 'Telephone Number',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            telephoneController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: mobileController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Mobile Number',
                        labelText: 'Mobile Number',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            mobileController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2.0,
                    ),
                    child: TextField(
                      maxLines: 1,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Email Address',
                        labelText: 'Email Address',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            emailController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: RaisedButton(
                              color: buttonColour,
                              elevation: 16.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: borderColour)),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "NewSaleScreen",
                                );
                                clearControllers();
                              },
                              child: Text(
                                "CANCEL",
                                style: TextStyle(color: borderColour),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: RaisedButton(
                              color: buttonColour,
                              elevation: 16.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: borderColour)),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "NewSaleScreen",
                                );
                                clearControllers();
                              },
                              child: Text(
                                "SAVE",
                                style: TextStyle(color: borderColour),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    organisationController.clear();
    address1Controller.clear();
    address3Controller.clear();
    townController.clear();
    postcodeController.clear();
    telephoneController.clear();
    mobileController.clear();
    emailController.clear();
  }
}
