import 'package:flutter/material.dart';
import 'package:flutter_base/home/center_widget.dart';

class BlueWidget extends StatelessWidget {
  const BlueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.blue,
      child: const CenterWidget(),
    );
  }
}
