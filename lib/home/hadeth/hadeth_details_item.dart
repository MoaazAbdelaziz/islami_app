import 'package:flutter/material.dart';

class HadethDetailsItem extends StatelessWidget {
  const HadethDetailsItem({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.titleSmall,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
