import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteState createState() => new _NoteState();
}

class _NoteState extends State<NoteScreen> {
  TextEditingController noteController = new TextEditingController();
  String statusDropdownValue = "Raised";

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
          title: Text("New Note"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: <Widget>[
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
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          color: buttonColour,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: borderColour)),
                          onPressed: () {
                            noteController.clear();
                            Navigator.pushNamed(
                              context,
                              "WarrantyScreen",
                            );
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(color: borderColour),
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
                            noteController.clear();
                            Navigator.pushNamed(
                              context,
                              "SAVE",
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
        ));
  }
}
