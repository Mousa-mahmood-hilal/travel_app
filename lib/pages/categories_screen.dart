import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        childAspectRatio: 5 / 6,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      children: Categories_data.map((categorydata) => CategoryItem(
          categorydata.id, categorydata.title, categorydata.imgsrc)).toList(),
    );
  }
}
