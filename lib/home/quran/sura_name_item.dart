import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';

class SuraNameItem extends StatelessWidget {
  const SuraNameItem({
    super.key,
    required this.suraName,
    required this.index,
  });
  final String suraName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: SuraDetailsArgs(
            name: suraName,
            index: index,
          ),
        );
      },
      child: Text(
        suraName,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
