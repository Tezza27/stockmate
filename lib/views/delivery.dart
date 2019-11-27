import 'package:flutter/material.dart';
import 'package:stockmate/models/delivery_card_class.dart';
import 'package:stockmate/templates/delivery_card.dart';
import 'package:stockmate/Settings/colours.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  _DeliveryState createState() => new _DeliveryState();
}

class _DeliveryState extends State<DeliveryScreen> {
  List<DeliveryCardClass> deliveryCardList = const <DeliveryCardClass>[
    DeliveryCardClass(
        invoiceNumber: "0101010101",
        deliveryDate: "05/11/19",
        itemQuantity: 436935),
    const DeliveryCardClass(
        invoiceNumber: "0202020202",
        deliveryDate: "06/11/19",
        itemQuantity: 29),
    const DeliveryCardClass(
        invoiceNumber: "0303030303",
        deliveryDate: "07/11/19",
        itemQuantity: 37),
    const DeliveryCardClass(
        invoiceNumber: "0404040404",
        deliveryDate: "08/11/19",
        itemQuantity: 22),
    const DeliveryCardClass(
        invoiceNumber: "0505050505",
        deliveryDate: "05/11/19",
        itemQuantity: 43),
    const DeliveryCardClass(
        invoiceNumber: "0606060606",
        deliveryDate: "06/11/19",
        itemQuantity: 29),
    const DeliveryCardClass(
        invoiceNumber: "0707070707",
        deliveryDate: "07/11/19",
        itemQuantity: 37),
    const DeliveryCardClass(
        invoiceNumber: "0808080808",
        deliveryDate: "08/11/19",
        itemQuantity: 22),
    const DeliveryCardClass(
        invoiceNumber: "0909090909",
        deliveryDate: "05/11/19",
        itemQuantity: 43),
    const DeliveryCardClass(
        invoiceNumber: "1010101010",
        deliveryDate: "06/11/19",
        itemQuantity: 29),
    const DeliveryCardClass(
        invoiceNumber: "1111111111",
        deliveryDate: "07/11/19",
        itemQuantity: 37),
    const DeliveryCardClass(
        invoiceNumber: "1212121212",
        deliveryDate: "08/11/19",
        itemQuantity: 22),
  ];
  TextEditingController controller = new TextEditingController();
  String dropdownValue = "Date Descending";
  String filter;

  @override
  void initState() {
    controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("Deliveries"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: iconColour,
              ),
              iconSize: 48.0,
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  "NewDeliveryScreen",);},
            ),
          ],
        ),
        body: Container(
          color: backgroundColour,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconEnabledColor: iconColour,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String dropdownSelection) {
                    setState(() {
                      dropdownValue = dropdownSelection;
                    });
                  },
                  items: <String>[
                    "Date Ascending",
                    "Date Descending",
                    "Invoice # Ascending",
                    "Invoice # Descending"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 2.0, bottom: 4.0),
                  child: TextField(
                    maxLines: 1,
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                      filled: true,
                      fillColor: textFieldColour,
                      hintText: 'Enter Invoice #',
                      labelText: 'Invoice # Search',
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
                        itemCount: deliveryCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){
                                Navigator.pushNamed(
                                    context,
                                    "DeliveryDetailScreen",);},
                              child: DeliveryCard(
                                  deliveryCard: deliveryCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
