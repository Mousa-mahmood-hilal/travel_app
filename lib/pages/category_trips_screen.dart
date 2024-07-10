import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenroute = '/tripscreen';

  final List<Trip> availabletrips;
const CategoryTripsScreen(this.availabletrips, {super.key});
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String? categorytitle;
  late List<Trip>displaytrips;
  
  @override
  Widget build(BuildContext context) {
   final routargument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryid = routargument['id'];
     final categorytitle = routargument['title'];
     final displaytrips= widget.availabletrips.where((trip) {
      return trip.categories.contains(categoryid);}).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categorytitle!),
          backgroundColor: Colors.amber,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return TripItem(
              title: displaytrips[index].title,
              imageUrl: displaytrips[index].imageUrl,
              duration: displaytrips[index].duration,
              season: displaytrips[index].season,
              tripType: displaytrips[index].tripType,
              id: displaytrips[index].id, 
            );
          },
          itemCount: displaytrips.length,
        ),
        );
  }
}
