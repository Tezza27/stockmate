import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/models/sale_card_class.dart';

class SaleCard extends StatelessWidget {
  const SaleCard({Key key, this.saleCard}) : super(key: key);
  final SaleCardClass saleCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: borderColour, width: 1.0)),
        color: lozengeColour,
        elevation: 16.0,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Sale #: " + saleCard.saleNumber,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Text(
                        "Sale Date:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        saleCard.saleDate.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Items:",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        saleCard.itemQuantity.toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Sold To: " + saleCard.saleTo,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sold by:" + saleCard.saleFrom,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}
