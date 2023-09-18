import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/hadeth/hadeth_name_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadeths = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (hadeths.isEmpty) {
      loadHadethFile();
    }

    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/hadeth_image.png'),
          Divider(
            color: provider.appTheme == ThemeMode.light
                ? Theme.of(context).primaryColor
                : MyTheme.yellowColor,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(
            color: provider.appTheme == ThemeMode.light
                ? Theme.of(context).primaryColor
                : MyTheme.yellowColor,
            thickness: 3,
          ),
          hadeths.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  flex: 3,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: provider.appTheme == ThemeMode.light
                            ? Theme.of(context).primaryColor
                            : MyTheme.yellowColor,
                        thickness: 2,
                      );
                    },
                    itemBuilder: (context, index) {
                      return HadethNameItem(
                        hadeth: hadeths[index],
                      );
                    },
                    itemCount: hadeths.length,
                  ),
                ),
        ],
      ),
    );
  }

  void loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(
        title: title,
        content: hadethLines,
      );
      hadeths.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({
    required this.title,
    required this.content,
  });
}
