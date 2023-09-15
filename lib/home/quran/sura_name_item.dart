import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<AppConfigProvider>(context);
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
        style: provider.appTheme == ThemeMode.light
            ? Theme.of(context).textTheme.titleSmall
            : Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.whiteColor,
                ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
