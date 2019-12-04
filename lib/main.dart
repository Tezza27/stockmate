import 'package:flutter/material.dart';
import 'package:stockmate/views/serial_list.dart';
import 'package:stockmate/views/delivery.dart';
import 'package:stockmate/views/delivery_detail.dart';
import 'package:stockmate/views/new_delivery.dart';
import 'package:stockmate/views/serial_detail.dart';
import 'package:stockmate/views/transfer.dart';
import 'package:stockmate/views/transfer_detail.dart';
import 'package:stockmate/views/new_transfer.dart';
import 'package:stockmate/views/sale.dart';
import 'package:stockmate/views/sale_detail.dart';
import 'package:stockmate/views/new_sale.dart';
import 'package:stockmate/views/customer_details_edit.dart';
import 'package:stockmate/views/warranty.dart';
import 'package:stockmate/views/warranty_detail.dart';
import 'package:stockmate/views/new_warranty.dart';
import 'package:stockmate/views/note.dart';
import 'package:stockmate/views/stock.dart';
import 'package:stockmate/views/new_product.dart';
import 'package:stockmate/views/serial_check.dart';
import 'package:stockmate/views/agents.dart';
import 'views/agent_details_edit.dart';
import 'views/menu.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StockMate",
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: "MenuScreen",
      routes: {
        "MenuScreen": (context) => MenuScreen(),
        "DeliveryScreen": (context) => DeliveryScreen(),
        "DeliveryDetailScreen": (context) => DeliveryDetailScreen(),
        "SerialListScreen": (context) => SerialListScreen(),
        "SerialDetailScreen": (context) => SerialDetailScreen(),
        "NewDeliveryScreen": (context) => NewDeliveryScreen(),
        "TransferScreen": (context) => TransferScreen(),
        "TransferDetailScreen": (context) => TransferDetailScreen(),
        "NewTransferScreen": (context) => NewTransferScreen(),
        "SaleScreen": (context) => SaleScreen(),
        "SaleDetailScreen": (context) => SaleDetailScreen(),
        "NewSaleScreen": (context) => NewSaleScreen(),
        "CustomerDetailsScreen": (context) => CustomerDetailsScreen(),
        "WarrantyScreen": (context) => WarrantyScreen(),
        "WarrantyDetailScreen": (context) => WarrantyDetailScreen(),
        "NewWarrantyScreen": (context) => NewWarrantyScreen(),
        "NoteScreen": (context) => NoteScreen(),
        "StockScreen": (context) => StockScreen(),
        "NewProductScreen": (context) => NewProductScreen(),
        "SerialCheckScreen": (context) => SerialCheckScreen(),
        "AgentScreen": (context) => AgentScreen(),
        "AgentDetailsScreen": (context) => AgentDetailsScreen(),

      },
    );
  }
}
