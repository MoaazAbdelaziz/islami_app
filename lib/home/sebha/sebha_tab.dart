import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_app/home/sebha/custom_container.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  List<String> tasbeh = [
    'سبحان الله',
    'الحمدالله',
    'الله اكبر',
  ];

  String tasbehContent = 'سبحان الله';
  int index = 0;

  late Animation<double> animation;
  late AnimationController controller;
  int tasbehNumber = 1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    setRotation(360);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, _) => Transform.rotate(
              angle: animation.value,
              child: InkWell(
                onTap: () {
                  controller.forward(from: 0);
                  setState(() {
                    tasbehLogic();
                  });
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -75,
                      left: 100,
                      child: Image.asset('assets/images/seb7a_head.png'),
                    ),
                    Image.asset('assets/images/seb7a_body.png'),
                  ],
                ),
              ),
            ),
          ),
          Text(
            'Number of tasbeh',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          CustomContainer(
            text: '$tasbehNumber',
            width: 70,
            height: 80,
          ),
          CustomContainer(
            text: tasbehContent,
            width: 137,
            height: 50,
          ),
        ],
      ),
    );
  }

  void tasbehLogic() {
    tasbehNumber++;
    tasbehContent = tasbeh[index];
    if (tasbehNumber >= 33 && tasbehNumber < 66) {
      tasbehContent = tasbeh[index + 1];
    } else if (tasbehNumber >= 66 && tasbehNumber <= 99) {
      tasbehContent = tasbeh[index + 2];
    } else {
      tasbehContent = tasbeh[index];
    }
    if (tasbehNumber > 99) {
      tasbehNumber = 1;
    }
  }

  void setRotation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }
}
