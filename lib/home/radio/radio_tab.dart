import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio_image.png'),
          Text(
            AppLocalizations.of(context)!.radio,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                const AssetImage('assets/images/Icon metro-reverse.png'),
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.primaryLight
                    : MyTheme.yellowColor,
              ),
              ImageIcon(
                const AssetImage('assets/images/Icon awesome-play.png'),
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.primaryLight
                    : MyTheme.yellowColor,
              ),
              ImageIcon(
                const AssetImage('assets/images/Icon metro-next.png'),
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.primaryLight
                    : MyTheme.yellowColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
