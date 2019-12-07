import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/models/stock_card_class.dart';
//import 'package:firebase_storage_image/firebase_storage_image.dart';

class StockCard extends StatelessWidget {
  final StockCardClass stockCard;
  const StockCard({this.stockCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: borderColour, width: 1.0)),
        color: lozengeColour,
        elevation: 16.0,
        borderOnForeground: true,

          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: stockCard.image != null
                    ? ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),

                    child:
                    Image.network(stockCard.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
//                    Image(image: FirebaseStorageImage(stockCard.image),
//                      fit: BoxFit.cover,
//                      width: double.infinity,
//                    ),
                )


                    : ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/Background.png"),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Center(
                          child: Text(
                            "IMAGE CURRENTLY UNAVAILABLE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: borderColour,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                )
                ,
              ),
              Flexible(
                flex: 5,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Product:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    stockCard.productName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "SKU:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    stockCard.sku,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 4.0),
                        child: Text(
                          stockCard.productDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "TMA:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                stockCard.tmaQuantity.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Agents",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                stockCard.agentQuantity.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Total",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                calculateTotal(stockCard.tmaQuantity,
                                    stockCard.agentQuantity)
                                    .toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),

      ),
    );
  }

  Widget fetchImage() {
    Widget myImage;
    if (stockCard.image != null) {
      myImage = Image.network(stockCard.image,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }
    else {
      myImage = Image(
        image: AssetImage("assets/Background.png"),
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }
    return myImage;
  }

  int calculateTotal(int tmaQty, int agentQty) {
    int totalQty;
    (tmaQty == null || agentQty == null)
        ? totalQty = 0
        : totalQty = tmaQty + agentQty;
    return totalQty;
  }
}
