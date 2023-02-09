import 'package:flutter/material.dart';

import '../utils/app_padding.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
    this.value = AppPadding.verticalPadding,
    this.isVertical = true,
  });

  final double value;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical ? value : null,
      width: isVertical ? null : value,
    );
  }
}
