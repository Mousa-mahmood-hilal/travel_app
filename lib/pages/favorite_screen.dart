import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';
class FavoriteScreen extends StatelessWidget {

  final List<Trip>favoritetrips;
  const FavoriteScreen(this.favoritetrips, {super.key});
  @override
  Widget build(BuildContext context) {
    if(favoritetrips.isEmpty)
    {
       return const Center(child:
      Text('You do not have any trip in your favorites list')
    );
    }
   else
   {
    return ListView.builder(
          itemBuilder: (ctx, index) {
            return TripItem(
              title: favoritetrips[index].title,
              imageUrl: favoritetrips[index].imageUrl,
              duration: favoritetrips[index].duration,
              season: favoritetrips[index].season,
              tripType: favoritetrips[index].tripType,
              id: favoritetrips[index].id, 
             
            );
          },
          itemCount: favoritetrips.length,
        );
   }
  }
}