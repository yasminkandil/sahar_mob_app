import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahar_mob_app/product_powerbank.dart';

Future getproduct = Getproducts().getname();
final productprovider = StateProvider<Future>((ref) => getproduct);

final productdataprovider = FutureProvider(
  (ref) async {
    return ref.watch(productprovider);
  },
);
