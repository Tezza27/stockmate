import 'package:flutter/material.dart';
import 'package:stockmate/models/serial_list_card_class.dart';
import 'package:stockmate/models/stock_card_class.dart';
import 'package:stockmate/templates/serial_list_card.dart';
import 'package:stockmate/Settings/colours.dart';

class SerialListScreen extends StatefulWidget {

//SerialListScreen(this.productInstance);
  @override
  _SerialListState createState() => new _SerialListState();
}

class _SerialListState extends State<SerialListScreen> {
StockCardClass productInstance;
// _SerialListState({this.productInstance});

  List<SerialListCardClass> serialListCardList = const <SerialListCardClass>[
    SerialListCardClass(
      serial: "123456789",
      status: "Taylormade Music Australia",
    ),
    SerialListCardClass(
      serial: "987654321",
      status: "Taylormade Music Australia",
    ),
    SerialListCardClass(
      serial: "123454321",
      status: "Concept Musical Instruments",
    ),
    SerialListCardClass(
      serial: "987656789",
      status: "Green Brothers",
    ),
    SerialListCardClass(
      serial: "987656790",
      status: "Taylormade Music Australia",
    ),
    SerialListCardClass(
      serial: "987656791",
      status: "Taylormade Music Australia",
    ),
    SerialListCardClass(
      serial: "987656792",
      status: "Ozwinds Brisbane",
    ),
    SerialListCardClass(
      serial: "987656793",
      status: "Ozwinds Brisbane",
    ),
  ];
  TextEditingController controller = new TextEditingController();
  String filter;



  @override
  void initState() {
    controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    productInstance = settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("Product:  ${this.productInstance.productName}"),
          centerTitle: true,
        ),
        body: Container(
          color: backgroundColour,
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
                        child: productInstance.image != null
                            ? Image.network(
                          productInstance.image,
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                        )
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
                        )
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
                                productInstance.productDescription,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productInstance.sku,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),

                            ],
                          ),
                        ),
                      ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 4.0, left: 4.0, bottom: 4.0),
                  child: TextField(
                    maxLines: 1,
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 2.0),
                      filled: true,
                      fillColor: textFieldColour,
                      hintText: 'Enter Serial #',
                      labelText: 'Serial # Search',
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
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: serialListCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  "SerialDetailScreen",);},
                              child: SerialListCard(
                                  serialListCard: serialListCardList[index]));
                        }),
                  ),
                ),
              ],
            ),

        ));
  }
}
