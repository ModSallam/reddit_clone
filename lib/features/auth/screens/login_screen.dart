import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common_widgets/custom_loading.dart';
import '../../../core/common_widgets/custom_login_button.dart';
import '../../../core/common_widgets/custom_sized_box.dart';
import '../../../core/utils/app_padding.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/image_assets.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageAssets.logo,
          width: 40,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              AppStrings.skip,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.horizontalPadding,
              vertical: AppPadding.verticalPadding,
            ),
            children: [
              const Text(
                AppStrings.diveIntoAnything,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  letterSpacing: 0.5,
                ),
              ),
              const CustomSizedBox(),
              Image.asset(
                ImageAssets.loginImage,
                height: 400,
              ),
              const CustomSizedBox(),
              const CustomLoginButton(),
            ],
          ),
          isLoading ? const CustomLoading() : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
