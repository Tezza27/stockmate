import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/models/transfer_card_class.dart';

class TransferCard extends StatelessWidget {
  const TransferCard({Key key, this.transferCard}) : super(key: key);
  final TransferCardClass transferCard;

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
                Text(
                  "Transfer #: " + transferCard.transferNumber,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Date: " + transferCard.transferDate,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  "From: " + transferCard.transferFrom,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  "To: " + transferCard.transferTo,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Items: " + transferCard.itemQuantity.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ]),
        ),
      ),
    );
  }
}
