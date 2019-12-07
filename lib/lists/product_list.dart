import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockmate/models/stock_card_class.dart';
import 'package:stockmate/templates/stock_card.dart';


class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final List<StockCardClass> products = Provider.of<List<StockCardClass>>(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, int index) {
          return InkWell(
              onTap: () {
                StockCardClass productInstance = StockCardClass(sku: products[index].sku, productName: products[index].productName, productDescription: products[index].productDescription, image: products[index].image);
                Navigator.pushNamed(
                  context,
                  "SerialListScreen",
                  arguments: productInstance,
                );
              },
              child: StockCard(stockCard: products[index]));
        });
  }
}
