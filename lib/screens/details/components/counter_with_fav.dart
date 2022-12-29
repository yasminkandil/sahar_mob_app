import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/cart_counter.dart';
import 'package:sahar_mob_app/screens/details/components/description.dart';
import 'package:sahar_mob_app/screens/details/components/product_info.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class CounterWithFav extends StatefulWidget {
  const CounterWithFav({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterWithFav> createState() => _CounterWithFavState();
}

class _CounterWithFavState extends State<CounterWithFav> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        Container(
          height: 32,
          width: 32,
          child: IconButton(
            onPressed: () {
              setState(() {
                if (_isFavorited) {
                  _favoriteCount -= 1;
                  _isFavorited = false;
                } else {
                  _favoriteCount += 1;
                  _isFavorited = true;
                }
              });
            },
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
          ),
        ),
        Text('$_favoriteCount')
      ],
    );
  }
}
