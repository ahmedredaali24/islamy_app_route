import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_detailles_screen.dart';
import 'package:islamy/home/quran/sura_detailles_screen.dart';

import 'hadeth_screen.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;


  ItemHadethName({required this.hadeth,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).pushNamed(HadthDetailsScreen.routeName,
        arguments:hadeth
        );
      } ,
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
