import 'package:flutter/material.dart';
import 'package:flutter_base/home/yellow_widget.dart';

class RedWidget extends StatelessWidget {
  const RedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: const YellowWidget(),
    );
  }
}
