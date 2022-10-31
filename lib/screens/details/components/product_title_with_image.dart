import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/products.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Samsung Power Bank",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(
                      text: "${product.price} LE",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ]),
              ),
              SizedBox(
                width: 3,
              ),
              Expanded(
                  child: Image.asset(
                product.image,
                fit: BoxFit.fitWidth,
              ))
            ],
          )
        ],
      ),
    );
  }
}
