/*import 'package:flutter/material.dart';
//import 'package:sahar_mob_app/constants.dart';
import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/products.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.8),
          child: Text("Power Banks",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        Categorie(),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(35),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: products[0].color,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(products[0].image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 / 4),
              child: Text(
                products[0].title,
                style: TextStyle(color: Color.fromARGB(102, 0, 0, 0)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
*/