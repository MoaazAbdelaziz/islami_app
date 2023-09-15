import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethNameItem extends StatelessWidget {
  const HadethNameItem({
    super.key,
    required this.hadeth,
  });
  final Hadeth hadeth;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetailsScreen.routeName,
          arguments: hadeth,
        );
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: provider.appTheme == ThemeMode.light
            ? Theme.of(context).textTheme.titleSmall
            : Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.whiteColor,
                ),
      ),
    );
  }
}
