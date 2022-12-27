import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class productinfo extends StatelessWidget {
  const productinfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[],
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
                style: TextStyle(color: Color.fromARGB(225, 0, 0, 0)),
                children: [
                  TextSpan(text: "Capacity\n"),
                  TextSpan(
                      text: "${product.quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.bold))
                ]),
          ),
        ),
      ],
    );
  }
}
