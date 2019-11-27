import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/models/warranty_detail_card_class.dart';

class WarrantyDetailCard extends StatelessWidget {
  const WarrantyDetailCard({Key key, this.warrantyDetailCard})
      : super(key: key);
  final WarrantyDetailCardClass warrantyDetailCard;

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
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0, left: 4.0, right: 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                warrantyDetailCard.noteDate,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                warrantyDetailCard.noteStatus,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                        ),
                        Text(
                          warrantyDetailCard.noteDetail,
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
            ],
          ),
        ),
      ),
    );
  }
}
