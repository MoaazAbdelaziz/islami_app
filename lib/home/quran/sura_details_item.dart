import 'package:flutter/material.dart';

class SuraDetailsItem extends StatelessWidget {
  const SuraDetailsItem(
      {super.key, required this.content, required this.index});
  final String content;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content {${index + 1}}',
      style: Theme.of(context).textTheme.titleSmall,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
