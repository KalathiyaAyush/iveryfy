import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/routes_manager.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.scaffoldBg,
        ),
        color: Colors.red,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        navigatorObservers: [routeObserver],
        navigatorKey: RouteGenerator.navigatorKey,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
