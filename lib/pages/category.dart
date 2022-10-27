import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/style/style.dart';
import 'package:sahar_mob_app/style/colors.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 6),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 50, 49, 48),
          ),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/noBack.png',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Category',
                        style: AppStyle.r12w,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Shop Now',
                    style: AppStyle.b32w,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            height: size.height - (size.height / 5),
            width: size.width,
            decoration: BoxDecoration(
                color: orangeColors, borderRadius: BorderRadius.circular(40)),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "all",
                    style: AppStyle.m12b
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Favorite",
                    style: AppStyle.m12bt,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Recommended",
                    style: AppStyle.m12bt,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        shortproducts(
                            background: AppColors.purple,
                            title: 'Cover Cases',
                            subtitle: "12 Products",
                            image: 'assets/covercase.png'),
                        longproducts(
                            background: AppColors.red,
                            title: 'Power Banks',
                            subtitle: "10 Products",
                            image: 'assets/powerbank.png'),
                        SizedBox(height: 12),
                        shortbottomproducts(
                            background: AppColors.pink,
                            title: 'Head Phones',
                            subtitle: "8 Products",
                            image: 'assets/headphone.png')
                      ],
                    ),
                    Column(
                      children: [
                        shortproducts(
                            background: AppColors.red,
                            title: 'Screen Protectors',
                            subtitle: "4 Products",
                            image: 'assets/protector.png'),
                        longproducts(
                            background: AppColors.green,
                            title: 'EarPhones',
                            subtitle: "8 Products",
                            image: 'assets/headphones.png'),
                        SizedBox(height: 12),
                        shortbottomproducts(
                            background: AppColors.brown,
                            title: 'Cables',
                            subtitle: "8 Products",
                            image: 'assets/cables.png')
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    ));
  }
}

class longproducts extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const longproducts(
      {super.key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 192,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(blurRadius: 50, color: Color(0xFF0B0C2A).withOpacity(.1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(title, style: AppStyle.m12w),
          Text(subtitle, style: AppStyle.r10wt),
          Expanded(child: Image.asset(image))
        ],
      ),
    );
  }
}

class shortproducts extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const shortproducts(
      {super.key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 163,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(blurRadius: 50, color: Color(0xFF0B0C2A).withOpacity(.1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(title, style: AppStyle.m12w),
          Text(subtitle, style: AppStyle.r10wt),
          Expanded(child: Image.asset(image))
        ],
      ),
    );
  }
}

class shortbottomproducts extends StatelessWidget {
  final Color background;
  final String title;
  final String subtitle;
  final String image;
  const shortbottomproducts(
      {super.key,
      required this.background,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      width: 155,
      height: 140,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(34),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(blurRadius: 50, color: Color(0xFF0B0C2A).withOpacity(.1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset(image)),
          Text(title, style: AppStyle.m12w),
          Text(subtitle, style: AppStyle.r10wt),
          const SizedBox(
            height: 13,
          )
        ],
      ),
    );
  }
}
