import 'package:flutter/material.dart';
import 'package:stockmate/models/menu_card_class.dart';
import 'package:stockmate/templates/menu_card.dart';
import 'package:stockmate/Settings/colours.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuCardClass> menuCardList = const <MenuCardClass>[
      const MenuCardClass(
          cardTitle: "Stock",
          cardIcon: Icons.pets,
          cardDestination: "StockScreen"),
      const MenuCardClass(
          cardTitle: "Serial Check",
          cardIcon: Icons.looks,
          cardDestination: "SerialCheckScreen"),
      const MenuCardClass(
          cardTitle: "Delivery",
          cardIcon: Icons.add_photo_alternate,
          cardDestination: "DeliveryScreen"),
      const MenuCardClass(
          cardTitle: "Sale",
          cardIcon: Icons.accessibility_new,
          cardDestination: "SaleScreen"),
      const MenuCardClass(
          cardTitle: "Transfer",
          cardIcon: Icons.schedule,
          cardDestination: "TransferScreen"),
      const MenuCardClass(
          cardTitle: "Warranty",
          cardIcon: Icons.build,
          cardDestination: "WarrantyScreen"),
      const MenuCardClass(
          cardTitle: "Agents",
          cardIcon: Icons.settings_voice,
          cardDestination: "AgentScreen"),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("StockMate"),
          centerTitle: true,
        ),
        body: Container(
          color: backgroundColour,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: OrientationBuilder(builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  children: List.generate(
                    menuCardList.length,
                    (index) {
                      return Center(
                        child: InkWell(
                            splashColor: borderColour,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, menuCardList[index].cardDestination);
                            },
                            child: MenuCard(menuCard: menuCardList[index])),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
