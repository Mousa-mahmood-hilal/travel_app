import 'package:flutter/material.dart';
import '../app_data.dart';
import '../models/trip.dart';
import '../pages/category_trips_screen.dart';
import '../pages/filters_screen.dart';
import '../pages/tabs_screens.dart';
import '../pages/trip_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map<String,bool>_filters={
'summer':false,
'winter':false,
'family':false,
};
List<Trip>_availabletrips=Trips_data;
  // ignore: prefer_final_fields
  List<Trip>_favoritetrips=[];
// ignore: no_leading_underscores_for_local_identifiers
void  _changedfilter(Map<String,bool>_filtersdata)
{
setState(() {
  _filters=_filtersdata;
  _availabletrips=Trips_data.where((trip){
    if(_filters['summer']==true && trip.isInSummer!=true)
    {
    return false;
    }
    if(_filters['winter']==true && trip.isInWinter!=true)
    {
    return false;
    }
    if(_filters['family']==true && trip.isForFamilies!=true)
    {
    return false;
    }
    return true;
  }).toList();
});
}
void _managefavorite(String tripid){
  final existingindex=_favoritetrips.indexWhere((trip)=>trip.id==tripid);
  if(existingindex>=0 && _favoritetrips.isNotEmpty)
  {
    setState(() {
      _favoritetrips.removeAt(existingindex);
    });
  }
  else{
    setState(() {
      _favoritetrips.add(Trips_data.firstWhere((trip)=>trip.id==tripid));
    });
  }
}
bool _isfavorite(String id)
{
  return _favoritetrips.any((trip)=>trip.id==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'travel app',
      initialRoute: '/',
      routes: {
        '/': (context) =>  TabsScreens(_favoritetrips),
        CategoryTripsScreen.screenroute: (context) =>
             CategoryTripsScreen(_availabletrips),
        TripDetailPage.screenroute: (context) => TripDetailPage(_managefavorite,_isfavorite),
      FiltersScreen.screenroute:(context)=> FiltersScreen(_filters,_changedfilter),
      },
      
    );
  }
}
