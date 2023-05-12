import 'package:flutter/material.dart';
import 'package:flutter_base/home/data_widget.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: DataWidget());
  }
}
