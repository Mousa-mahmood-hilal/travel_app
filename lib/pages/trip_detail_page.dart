// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailPage extends StatelessWidget {
  static const screenroute = '/trip-detail';

  final Function managefavorite;
  final Function isfavorite;
  const TripDetailPage(this.managefavorite,this.isfavorite, {super.key});
  Widget buildsectiontitle(String titletext) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        alignment: Alignment.topLeft,
        child: Text(
          titletext,
          style: const TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 189, 144, 10),
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget buildlistview(Widget childwidget) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 200,
      child: childwidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)?.settings.arguments as String;
    final selectedtrip = Trips_data.firstWhere((trip) => trip.id == tripid);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedtrip.title,
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(selectedtrip.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildsectiontitle('Activities'),
            buildlistview(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: Text(selectedtrip.activities[index],
                        style: const TextStyle(fontSize: 18)),
                  ),
                ),
                itemCount: selectedtrip.activities.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildsectiontitle('programs'),
            buildlistview(ListView.builder(
              itemCount: selectedtrip.program.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('day ${index + 1}'),
                    ),
                    title: Text(selectedtrip.program[index],
                        style: const TextStyle(fontSize: 18)),
                  ),
                  const Divider()
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child:Icon(
            isfavorite(tripid) ? Icons.star: Icons.star_border
          ),
          onPressed: ()=>managefavorite(tripid),
      ),

    );
  }
}
