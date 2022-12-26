import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'assets/1.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/2.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/3.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/4.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/5.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/6.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/7.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/8.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/9.jpg',
  ),
  ImageDetails(
    imagePath: 'assets/10.jpg',
  ),
];

class gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  return Navigation_bar();
                }),
              );
            }),
      ),
      backgroundColor: orangeColors,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;

  ImageDetails({
    required this.imagePath,
  });
}
