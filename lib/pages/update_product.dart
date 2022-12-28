/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahar_mob_app/controllers/product_controllers.dart';
import 'package:sahar_mob_app/models/product_model.dart';
import 'package:sahar_mob_app/utils/color.dart';
import '../controllers/text_edit_controller.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
       onPressed: () => Get.back(), icon: const Icon(Icons.search),
),
      ), // AppBar
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
// Future Builder to load cloud data
          child: FutureBuilder(
            future: controller.getProds(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  ProductModel prods = snapshot.data as ProductModel;
                  final name = TexteditingController(text: prods.name);
                  final Price =
                      TexteditingController(text: prods.price);
                  final Capacity = TexteditingController(text: prods.capacity);
                  final Description = TexteditingController(text: prods.description);
                  return Column(
                    children: [
// -- IMAGE with ICON
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                          //    initialValue: prods.capacity,
                              decoration: const InputDecoration(
                                  //Label: Text (tFULLName), prefixIcon: Icon (LineAwesomeIcons.user)
                                  ), // InputDecorati
                            ), // TextFormField const SizedBox(height: tFormHeight - 20), TextFormField(...), // TextFormField

                            const SizedBox(height: 20),
                            TextFormField(
                            controller:  Price,
                           //   initialValue: prods.capacity,
//decoration: const InputDecoration(
                              //Label: Text (tEna1l), prefixIcon: Icon(LineAwesomeIcons.envelope_1)), // Inputbecoration
                            ), // /7 TextFornField
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: Capacity,
// decoration: const InputDecoration(
                              //Label: Text (PhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)
                            ),
                            // InputDecoration ), // TextFornField
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: Description,
// decoration: InputDecoration(
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final prodData = ProductModel(
                                    name: controller.name.text.trim(),
                                    price: controller.Price.text.trim(),
                                    capacity: controller.capacity.text.trim(),
                                    description: controller.Description.text.trim(),
                                      
                                  ); // UserModel

                                  await controller.updateRecord(prods);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: GreyColors,
                                  side: BorderSide.none,
                                ),
                                child: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }
              else
              {
                        return Text('loading..');

              }
            },
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
*/