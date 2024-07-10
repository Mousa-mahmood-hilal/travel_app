// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenroute = '/filter';
  final Function savefilters;
  final Map<String,bool>currentfilters;
  const FiltersScreen(this.currentfilters,this.savefilters, {super.key});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _summer = false;
  bool _Families = false;
  bool  _Winter = false;
  @override
  initState(){
    _summer=widget.currentfilters['summer']!;
    _Winter=widget.currentfilters['winter']!;
    _Families=widget.currentfilters['family']!;
    super.initState();
  }
  late final VoidCallback onpressed;
  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool currentvalue, onpressed) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentvalue,
        onChanged: onpressed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('filter'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedfilter = {
                    'summer': _summer,
                    'winter': _Winter,
                    'family': _Families,
                  };
                  widget.savefilters(selectedfilter);
                },
                icon:const Icon(Icons.save))
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    'summer places', 'just show summer places', _summer,
                    (newvalue) {
                  setState(() {
                    _summer = newvalue;
                  });
                }),
                buildSwitchListTile(
                    'winter places', 'just show winter places', _Winter,
                    (newvalue) {
                  setState(() {
                    _Winter = newvalue;
                  });
                }),
                buildSwitchListTile(
                    'family places', 'just show family places', _Families,
                    (newvalue) {
                  setState(() {
                    _Families = newvalue;
                  });
                }),
              ],
            )),
          ],
        ));
  }
}
