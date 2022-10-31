import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  @override
  CartView({super.key});
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ), // Icon
            onPressed: () {},
          ), // IconButton
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Shopping cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ), // TextStyle
              ), // Text

              SizedBox(height: 18.0),
              CartItem(),
              CartItem(),
              CartItem(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    "\u20b9 9,000",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Delivery Charge",
                    style: TextStyle(
                        //fontWeight:FontWeight.bold,
                        fontSize: 14.0),
                  ),
                  Text(
                    "\u20b9 9,000",
                    style: TextStyle(
                        // fontWeight:FontWeight.bold,
                        fontSize: 14.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Delivery Charge",
                    style: TextStyle(
                        //fontWeight:FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  Text(
                    "\u20b9 9,000",
                    style: TextStyle(
                        // fontWeight:FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,

            height: 80.0,

            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(20.0),
            ), // BoxDecoration

            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,

                    image: NetworkImage(
                        "https://pngimg.com/image/101982"), // DecorationImage
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100.0,
                child: Text(
                  "Sony Gaming headphones",

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ), // TextStyle
                ),
              ), // Text

              // Container

              SizedBox(height: 8.0),

              Row(
                children: [
                  Container(
                    width: 20.0,

                    height: 20.0,

                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ), // BoxDecoration

                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ),
                ],
              ),

              Container(
                width: 20.0,

                height: 20.0,

                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(4.0),
                ), // BoxDecoration

                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),

              Spacer(),

              Text(
                "\u20b9 650",
                style: TextStyle(
                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                  // TextStyle
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                child: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 16.0,

                    fontWeight: FontWeight.bold,

                    // TextStyle
                  ),
                ),

                // Text
              ), // Padding

              Container(
                width: 20.0,

                height: 20.0,

                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(4.0),
                ), // BoxDecoration

                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),

              //Spacer(),

              Text(
                "650",
                style: TextStyle(
                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                  // TextStyle
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(20.0),
            ), // BoxDecoration
          ),
        ],
      ),
    );
  }
}
