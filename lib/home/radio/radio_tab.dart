import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio_image.png'),
          Text(
            'Quran Kareem Channel',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                const AssetImage('assets/images/Icon metro-reverse.png'),
                color: MyTheme.primaryLight,
              ),
              ImageIcon(
                const AssetImage('assets/images/Icon awesome-play.png'),
                color: MyTheme.primaryLight,
              ),
              ImageIcon(
                const AssetImage('assets/images/Icon metro-next.png'),
                color: MyTheme.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
