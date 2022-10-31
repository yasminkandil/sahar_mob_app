import 'package:flutter/material.dart';
import 'package:sahar_mob_app/Providers/productprvider.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/products.dart';
import 'package:sahar_mob_app/screens/details/components/cart_counter.dart';
import 'package:sahar_mob_app/screens/details/components/counter_with_fav.dart';
import 'package:sahar_mob_app/screens/details/components/description.dart';
import 'package:sahar_mob_app/screens/details/components/product_info.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                    top: size.height * 0.12, left: 10, right: 10),
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    productinfo(product: product),
                    description(product: product),
                    CounterWithFav(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 50,
                            width: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: product.color)),
                            child: IconButton(
                              icon: Icon(
                                Icons.add_shopping_cart_outlined,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                                height: 50,
                                child: FloatingActionButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  backgroundColor: product.color,
                                  onPressed: () {},
                                  child: Text("BUY NOW",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ProductTitleWithImage(product: product)
            ]),
          )
        ],
      ),
    );
  }
}
