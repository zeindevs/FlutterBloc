import 'package:flutter/material.dart';
import 'package:flutter_base/home/blue_widget.dart';

class YellowWidget extends StatelessWidget {
  const YellowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.amber,
      child: const BlueWidget(),
    );
  }
}
