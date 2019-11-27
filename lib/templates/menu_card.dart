import 'package:flutter/material.dart';
import 'package:stockmate/models/menu_card_class.dart';
import 'package:stockmate/Settings/colours.dart';

class MenuCard extends StatelessWidget{
  const MenuCard({Key key, this.menuCard}): super(key: key);
  final MenuCardClass menuCard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: borderColour, width: 1.0)),
        elevation: 8.0,
        borderOnForeground: true,

color: buttonColour,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(menuCard.cardIcon, size: 90.0, color: iconColour,),
                Text(menuCard.cardTitle, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: iconTextColour),),
              ]
          ),
        ),

      ),
    );
  }

}