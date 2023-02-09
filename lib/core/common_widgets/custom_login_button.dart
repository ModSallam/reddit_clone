import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controllers/auth_controller.dart';
import '../../theme/pallete.dart';
import '../utils/app_strings.dart';
import '../utils/image_assets.dart';

class CustomLoginButton extends ConsumerWidget {
  const CustomLoginButton({
    super.key,
  });

  void googleSignIn(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => googleSignIn(ref, context),
      icon: Image.asset(
        ImageAssets.googleImage,
        width: 40,
      ),
      label: const Text(
        AppStrings.continueWithGoogle,
        style: TextStyle(
          fontSize: 18.0,
          color: Pallete.whiteColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.greyColor,
        minimumSize: const Size(
          double.infinity,
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
