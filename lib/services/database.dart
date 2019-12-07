import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stockmate/models/stock_card_class.dart';

class DatabaseService {
  final String sku;

  DatabaseService({this.sku});

  //collection reference
  final CollectionReference productCollection =
      Firestore.instance.collection("products");

// Establishes and updates product line documents
  Future updateProductData(String productCode, String productDescription,
      String productImage) async {
    return await productCollection.document(sku).setData({
      'productCode': productCode,
      'productDescription': productDescription,
      'productImage': productImage,
    });
  }

  //product list from snapshot
  List<StockCardClass> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return StockCardClass(
        sku:doc.documentID,
productName: doc.data["productCode"]??"",
productDescription: doc.data["productDescription"]??"",
        image: doc.data["productImage"]??"",
//      final String sku;
//      final String productName;
//      final String productDescription;
//      final int tmaQuantity;
//      final int agentQuantity;
//      final String image;
      );
    }).toList();
  }

  //Get product line stream
  Stream<List<StockCardClass>> get products {
    return productCollection.snapshots().map(_productListFromSnapshot);

  }
}
