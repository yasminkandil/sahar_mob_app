import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';

class EditProductPage extends StatefulWidget {
  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  
  String selectedValC = 'black';
  String selectedValQ = 'Original';
  String selectedValCat = 'Headphones';
 final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
 Future<void> update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                        double.tryParse(_priceController.text);
                    if (price != null) {

                        await _products
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "price": price});
                      _nameController.text = '';
                      _priceController.text = '';
                        Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
  List Listcolors = ['black', 'blue'];
  List ListCateg = [
    'Headphones',
    'PowerBank',
    'Speakers',
    'Chargers',
    'Cables',
    'Memory',
    'Maintanance'
  ];
  List ListQuality = ['Original', 'HighCopy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        backgroundColor: GreyColors,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: orangeColors,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: GreyColors,
              ),
              onPressed: () {})
        ],
      ),
      //backgroundColor: Color.fromARGB(255, 103, 101, 101),
      body: Container(
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            // HeaderContainer("Register"),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 90,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Color.fromARGB(255, 103, 101, 101)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://m.media-amazon.com/images/I/51ZJGZUfJhL._AC_SX679_.jpg'))),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            color: Colors.orange),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(
                            hint: "PowerBank",
                            icon: Icons.edit,
                            label: "Product Name"),
                        _textInput(
                            hint: "samsung",
                            icon: Icons.edit,
                            label: "Description"),
                        _textInput(
                            hint: "fastcharger",
                            icon: Icons.edit,
                            label: "About"),
                        _textInput(
                            hint: "369", icon: Icons.money, label: "Price"),
                        _textInput(
                            hint: "30", icon: Icons.numbers, label: "Quantity"),
                        _dropDown(
                          hint: "colors",
                          icon: Icons.border_color,
                          listt: Listcolors,
                          select: "black",
                        ),
                        _dropDown(
                          hint: "Quality",
                          icon: Icons.high_quality,
                          listt: ListQuality,
                          select: "Original",
                        ),
                        _dropDown(
                          hint: "Category",
                          icon: Icons.category,
                          listt: ListCateg,
                          select: "Headphones",
                        ),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: ButtonWidget2(
                                  btnText: "Edit Product",
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Expanded(
                                child: ButtonWidgetdelete(
                                  btnText: "Delete Product",
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, label}) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 249, 118, 3),
          ),
        ),
      ),
    );
  }

  Widget _dropDown({hint, icon, required List listt, required String select}) {
    return DropdownButtonFormField(
      value: select,
      items: listt
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          select = val as String;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Color.fromARGB(255, 249, 118, 3),
      ),
      dropdownColor: Color.fromARGB(255, 249, 118, 3),
      decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 249, 118, 3),
          ),
          border: UnderlineInputBorder()),
    );
  }
}
