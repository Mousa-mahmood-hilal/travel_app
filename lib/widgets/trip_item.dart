import 'package:flutter/material.dart';
import '../pages/trip_detail_page.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  

  const TripItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.id, 
     });
  String get seasontext {
    switch (season) {
      case Season.Winter:
        return 'Winter';
      case Season.Spring:
        return 'Spring';
      case Season.Summer:
        return 'Summer';
      case Season.Automn:
        return 'Automn';
      default:
        return 'undefinde';
    }
  }

  String get triptypetext {
    switch (tripType) {
      case TripType.Exploration:
        return 'Exploration';
      case TripType.Activities:
        return 'Summer';
      case TripType.Recovery:
        return 'Recovery';
      case TripType.Therapy:
        return 'Therapy';
      default:
        return 'undefinde';
    }
  }

  void selecttrip(BuildContext context) {
    Navigator.of(context).pushNamed(TripDetailPage.screenroute, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: () => selecttrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image(
                    image: AssetImage(imageUrl),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8)
                      ],
                          stops: const [
                        0.6,
                        1
                      ])),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.amber,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration days',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.amber,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        seasontext,
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        triptypetext,
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
