/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sahar_mob_app/models/ProductModel.dart';

class ProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'products';

  Future<List<Product>> getsaleProducts() => _firestore
          .collection(collection)
          .where('onSale', isEqualTo: true)
          .get()
          .then((snap) {
        List<Product> sproducts = [];
        snap.docs
            .map((snapshot) => sproducts.add(Product.fromSnapshot(snapshot)));
        return sproducts;
      });
}
*/