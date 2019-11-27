import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';

class SerialCheckScreen extends StatefulWidget {
  @override
  _SerialCheckState createState() => new _SerialCheckState();
}

class _SerialCheckState extends State<SerialCheckScreen> {
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColour,
        title: Text("Serial Check"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: iconColour,
            ),
            iconSize: 48.0,
            onPressed: (){},
          ),
        ],
      ),
      body: Container(
        color: backgroundColour,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
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
                          controller: controller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 2.0),
                            filled: true,
                            fillColor: textFieldColour,
                            hintText: 'Serial Number',
                            labelText: 'Enter Serial Number',
                            labelStyle: TextStyle(color: borderColour),
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
                            "SerialDetailScreen",
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
            ],
          ),
        ),
      ),
    );
  }
}
