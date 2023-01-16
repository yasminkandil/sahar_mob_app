import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:sahar_mob_app/models/cart_model2.dart';
import 'package:sahar_mob_app/pages/checkout.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:sahar_mob_app/home/home_page.dart';

import '../utils/color.dart';
import 'components/custom_cart_item.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  List<CartModel2> cartList = [];
  List<String> productsName = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAllCart();
    getAllProductPrice();
  }

  int allPrices = 0;

  void getAllProductPrice() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("cart")
        .doc(uid)
        .collection(uid)
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        CartModel2 cartModel2 = CartModel2.fromJson(element.data());
        int m = int.parse("${cartModel2.totalPrice}");
        allPrices += m;
      });
      setState(() {});
    });
  }

  void getAllCart() {
    setState(() {
      isLoading = true;
    });
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection("cart")
        .doc(uid)
        .collection(uid)
        .snapshots()
        .listen((value) {
      cartList.clear();
      productsName.clear();
      value.docs.forEach((element) {
        CartModel2 cartModel2 = CartModel2.fromJson(element.data());
        cartList.add(cartModel2);
        productsName.add("${cartModel2.name}");
      });
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cart'),
        backgroundColor: GreyColors,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: orangeColors,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MyHomePage();
              }),
            );
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomCartItem(cartList[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: cartList.length,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[500],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Price:  $allPrices EGP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                        ],
                      ),
                      SizedBox(height: 10),
                      MaterialButton(
                        height: 60.0,
                        minWidth: double.infinity,
                        color: GreyColors,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => checkout(
                                      products: productsName,
                                      totalPrice: allPrices,
                                    ))),
                        child: Text("Proceed to Checkout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: orangeColors,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )
      /*Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 32.0),
                      Text("Your cart is empty!"),
                      SizedBox(height: 8.0),
                      MaterialButton(
                        height: 60.0,
                        minWidth: double.infinity,
                        color: GreyColors,
                        onPressed: () {},
                        child: Text("Proceed to Checkout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: orangeColors,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )*/
      ,
    );
  }
}
