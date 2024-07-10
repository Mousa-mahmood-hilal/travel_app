import 'package:flutter/material.dart';
import '../pages/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgsrc;
  const CategoryItem(this.id, this.title, this.imgsrc, {super.key});
  void selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryTripsScreen.screenroute, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      // splashColor:,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(imgsrc),
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Text(
              title,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
