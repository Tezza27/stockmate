import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';

class NewProductScreen extends StatefulWidget {
  @override
  _NewProductState createState() => new _NewProductState();
}

class _NewProductState extends State<NewProductScreen> {
  TextEditingController productController = new TextEditingController();
  TextEditingController skuController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  String dropdownValue = "Product Ascending";
  String filter;

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
          title: Text("New Product"),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: buttonColour,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          )),

//              child: _storedImage != null
//                  ? ClipRRect(
//                  borderRadius: BorderRadius.circular(10.0),
//                  child: Image.file(
//                    _storedImage,
//                    fit: BoxFit.cover,
//                    width: double.infinity,
//                  ))
                      child: Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 85.0, bottom: 85.0),
                          child: Container(
                            child: Icon(
                              Icons.camera_enhance,
                              size: 30,
                              color: iconColour,
                            ),
                          ),
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
                              onPressed: () {},
                              child: Icon(Icons.attach_file, color: iconColour,
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
                              onPressed: () {},
                              child: Icon(Icons.camera_enhance, color: iconColour,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                    child: TextField(
                      maxLines: 1,
                      controller: productController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Product Code',
                        labelText: 'Enter Product Code',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            productController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 4.0, right: 4.0, left: 4.0),
                    child: TextField(
                      maxLines: 1,
                      controller: skuController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'SKU',
                        labelText: 'Enter SKU',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide()),
                        suffixIcon: IconButton(
                          icon: Container(
                            child: Icon(Icons.clear),
                          ),
                          onPressed: () {
                            skuController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 4.0, right: 4.0, left: 4.0),
                    child: TextField(
                      maxLines: 1,
                      controller: descriptionController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 2.0),
                        filled: true,
                        fillColor: textFieldColour,
                        hintText: 'Product Description',
                        labelText: 'Enter Product Description',
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
                                  "StockScreen",
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
                                  "StockScreen",
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
    productController.clear();
    skuController.clear();
    descriptionController.clear();
  }
}
