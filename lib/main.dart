// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:nutri_guard_mobile/providers/multi_providers.dart';
// import 'package:nutri_guard_mobile/res/notifications.dart';
// import 'package:nutri_guard_mobile/res/utils.dart';
// import 'package:provider/provider.dart';
// import 'core/routes/app_router.dart';
// import 'core/routes/app_routes.dart';
//
// import 'features/spike/spike_service.dart';
// import 'firebase_options.dart';
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await PreferenceUtils.init();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await FirebaseMessagingService().configureFirebaseMessaging();
//
//
//   // Stripe.publishableKey = "sk_test_51Q6HIG1loAXLjJUY6B3P2ohUAl3nuoy7Ff6VPONHZAwoQpNtGvUGgoxMuzQkmEElT4puYSMenoqgh5JKX69jlz0C00GIwF8pky";
//   // Stripe.instance.applySettings();
//   // try {
//   //   await SpikeService.initializeSpike();
//   // } catch (e) {
//   //   debugPrint('Error during initialization: $e');
//   // }
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: multiProviders,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'NutriGuard',
//         navigatorKey: navigatorKey,
//         initialRoute: AppRoutes.splashScreen,
//         onGenerateRoute: AppRouter.onGenerateRoute,
//       ),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutri_guard_mobile/providers/multi_providers.dart';
import 'package:nutri_guard_mobile/res/notifications.dart';
import 'package:nutri_guard_mobile/res/utils.dart';
import 'package:provider/provider.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await PreferenceUtils.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessagingService().configureFirebaseMessaging();
  } catch (e) {
    debugPrint('Error during initialization: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NutriGuard',
        navigatorKey: navigatorKey,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}