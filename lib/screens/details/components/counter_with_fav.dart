import 'package:flutter/material.dart';
import 'package:sahar_mob_app/Providers/productprvider.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/products.dart';
import 'package:sahar_mob_app/screens/details/components/cart_counter.dart';
import 'package:sahar_mob_app/screens/details/components/description.dart';
import 'package:sahar_mob_app/screens/details/components/product_info.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class CounterWithFav extends StatelessWidget {
  const CounterWithFav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        Container(
          height: 32,
          width: 32,
          child: Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
      ],
    );
  }
}
