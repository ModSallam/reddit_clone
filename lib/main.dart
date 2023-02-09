import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_riverpod/core/common_widgets/custom_error.dart';
import 'package:reddit_clone_riverpod/core/common_widgets/custom_loading.dart';
import 'package:reddit_clone_riverpod/features/auth/controllers/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

import 'models/user_model.dart';
import 'router.dart';
import 'theme/pallete.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData() {}

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangedProvider).when(
          data: (user) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Reddit',
            theme: Pallete.darkModeAppTheme,
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                if (user != null) {
                  return loggedInRoute;
                } else {
                  return loggedOutRoute;
                }
              },
            ),
            routeInformationParser: const RoutemasterParser(),
          ),
          error: (error, stackTrace) => CustomError(errorMessage: '$error'),
          loading: () => const Scaffold(
            body: CustomLoading(),
          ),
        );
  }
}
