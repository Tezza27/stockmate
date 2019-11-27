import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/models/stock_card_class.dart';

class StockCard extends StatelessWidget {
  const StockCard({Key key, this.stockCard})
      : super(key: key);
  final StockCardClass stockCard;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  child: Image(
                    image: AssetImage(stockCard.image),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
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
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                stockCard.tmaQuantity.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Agents",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                stockCard.agentQuantity.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Total",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  calculateTotal(stockCard.tmaQuantity, stockCard.agentQuantity).toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, fontWeight: FontWeight.bold),
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
      ),
    );
  }
  int calculateTotal(int tmaQty, int agentQty){
    return tmaQty + agentQty;

  }
}
