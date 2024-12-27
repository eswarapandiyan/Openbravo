import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:openbravo_pro/main.dart';

import 'app_config/app_routes.dart';
import 'app_utils/index_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Openbravo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: 'splash',
      builder: EasyLoading.init(),
      onGenerateRoute: AppRoute.allRoutes,
      navigatorKey: navigatorKey,
      theme: WAppTheme.lightTheme,
      darkTheme: WAppTheme.darkTheme,
    );
  }
}

// class InitialBinding {
//   initialBinding() async {
//     // Ensures Flutter binding is initialized
//     WidgetsFlutterBinding.ensureInitialized();
//     // Initialize Hive
//     final appDocumentDir =
//         await path_provider.getApplicationDocumentsDirectory();
//     Hive.init(appDocumentDir.path);
//     // Open the box
//     await Hive.openBox('box_Welleazy');
//   }
// }
