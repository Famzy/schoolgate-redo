import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schoolgate/utils/app_strings.dart';
import 'package:schoolgate/utils/theme/app_theme.dart';
import 'core/di/injector.dart';
import 'core/provider/providers.dart';
import 'package:sizer/sizer.dart';

import 'core/routes/navigation_routes.dart';
import 'core/services/utils/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjections();
  runApp(Providers.init(const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: AppStrings.appName,
            navigatorObservers: [routeObserver],
            navigatorKey: di<NavigationService>().navigationKey,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            onGenerateRoute: di<NavigationService>().generateRoute,
            initialRoute: TabNavigatorRoutes.splashScreen,
          );
        }
    );
  }
}
