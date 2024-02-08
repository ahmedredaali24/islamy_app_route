import 'package:flutter/material.dart';
import 'package:islamy/home/quran/sura_detailles_screen.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}