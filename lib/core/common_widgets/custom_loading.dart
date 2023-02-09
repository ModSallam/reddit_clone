import 'package:flutter/material.dart';

import '../../theme/pallete.dart';
import '../utils/app_strings.dart';
import 'custom_sized_box.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Pallete.greyColor,
        ),
        child: PreferredSize(
          preferredSize: const Size(
            120,
            120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator.adaptive(),
              CustomSizedBox(value: 10),
              Text(AppStrings.loading),
            ],
          ),
        ),
      ),
    );
  }
}
