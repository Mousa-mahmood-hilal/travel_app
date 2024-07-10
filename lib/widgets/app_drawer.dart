import 'package:flutter/material.dart';
import '../pages/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
     Widget buildlisttile(BuildContext context,String title,IconData icon,String routename) {
    return ListTile(
          leading: Icon(
            icon,
            size: 30,
            color:const Color.fromARGB(255, 12, 9, 1),
          ),
          title: Text(title,style:const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          onTap:(){
            Navigator.of(context).pushReplacementNamed(routename);
          }
        );
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
        Container(
            height: 100,
            width: double.infinity,
            padding:const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: const Text('travel app',
            style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
           const SizedBox(
            height: 20,
          ),
          buildlisttile(context,'category',Icons.card_travel,'/'),
          buildlisttile(context,'filter',Icons.filter_list,FiltersScreen.screenroute),
        ],
      ),
    );
  }
}
 