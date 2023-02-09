import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/helper/helper.dart';
import '../../../models/user_model.dart';
import '../repositories/auth_repository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

final authStateChangedProvider = StreamProvider(
  (ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    return authController.authStateChanged;
  },
);

final getUserDataProvider = StreamProvider.family(
  (ref, String uid) {
    final authController = ref.watch(authControllerProvider.notifier);
    return authController.getUserData(uid);
  },
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({
    required AuthRepository authRepository,
    required Ref ref,
  })  : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChanged => _authRepository.authStateChanged;

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;
    user.fold(
      (failure) => showSnackBar(
        context,
        failure.errorMessage,
      ),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }
}
