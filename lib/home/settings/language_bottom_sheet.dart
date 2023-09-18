import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            provider.changeLanguage('en');
          },
          child: provider.appLanguage == 'en'
              ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
              : getUnselectedLanguageItem(
                  AppLocalizations.of(context)!.english),
        ),
        InkWell(
          onTap: () {
            provider.changeLanguage('ar');
          },
          child: provider.appLanguage == 'ar'
              ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
              : getUnselectedLanguageItem(AppLocalizations.of(context)!.arabic),
        ),
      ],
    );
  }

  Widget getSelectedItemWidget(String language) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.blackColor,
                    ),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget getUnselectedLanguageItem(String language) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            language,
            style: provider.appTheme == ThemeMode.light
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.blackColor,
                    ),
          ),
        ],
      ),
    );
  }
}
