import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahar_mob_app/models/cart_model2.dart';
import 'package:sahar_mob_app/pages/checkout.dart';
import 'package:sahar_mob_app/pages/products_all.dart';
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
      allPrices = 0;
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
      isLoading = true; // Loading => haygeb al data
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
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ),
        body: isLoading
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : Column(
                children: [
                  SizedBox(height: 15),
                  Expanded(
                    child: cartList.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.remove_shopping_cart,
                                    size: 100, color: Colors.grey),
                                Text(" Your Cart Is Empty 😓",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ],
                            ),
                          )
                        : ListView.separated(
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
                          onPressed: () {
                            if (cartList.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Sorry your cart is Empty 😇",
                                  backgroundColor: Colors.red);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => checkout(
                                            products: productsName,
                                            totalPrice: allPrices,
                                          )));
                            }
                          },
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
              ));
  }
}
