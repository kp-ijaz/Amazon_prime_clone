import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselCustom extends StatelessWidget {
  const CarouselCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (int i = 0; i < itemBanners.length; i++)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(itemBanners[i]), fit: BoxFit.cover),
            ),
            alignment: Alignment.center,
          ),
      ],
      options: CarouselOptions(
          pageSnapping: true,
          viewportFraction: .99,
          height: 250,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3)),
    );
  }
}

List<String> itemBanners = [
  "assets/images/dark.png",
  "assets/images/the-batman-new-poster-2.webp",
  "assets/images/moolight.jpg",
  "assets/images/bRbadd.jpg",
  "assets/images/open.jpg"
];
