import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/services/database.dart';

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
  File selectedImage;
  String imageURL;

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
                        child: selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.file(
                                  selectedImage,
                                  fit: BoxFit.fitHeight,
                                  width: double.infinity,
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Stack(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                        "assets/Background.png",
                                      ),
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    ),
                                    Center(
                                        child: Text(
                                      "IMAGE CURRENTLY UNAVAILABLE",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: borderColour,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              )),
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
                              onPressed: getImageGallery,
                              child: Icon(
                                Icons.image,
                                color: iconColour,
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
                              onPressed: getImageCamera,
                              child: Icon(
                                Icons.camera_enhance,
                                color: iconColour,
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
                              onPressed: () async {
                                String _sku = skuController.text;
                                String _productCode = productController.text;
                                String _description =
                                    descriptionController.text;
                                String imageName = "$_sku\.jpg";
                                Navigator.pushNamed(
                                  context,
                                  "StockScreen",
                                );

                                await uploadImage(context, imageName);

                                await DatabaseService(sku: _sku)
                                    .updateProductData(_productCode,
                                        _description, imageURL);

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

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    setState(() {
      selectedImage = image;
    });
  }

  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      selectedImage = image;
    });
  }

  Future <String> uploadImage(BuildContext context, String imageName) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(imageName);
    StorageUploadTask uploadTask = storageReference.putFile(selectedImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    return imageURL = Uri.parse(await storageReference.getDownloadURL() as String).toString();
  }

  void clearControllers() {
    productController.clear();
    skuController.clear();
    descriptionController.clear();
    selectedImage = null;
  }
}
