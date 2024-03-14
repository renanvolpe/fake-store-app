import 'package:fake_store_joao/core/router/router.dart';
import 'package:fake_store_joao/core/themes/colors_app.dart';
import 'package:fake_store_joao/logic/get_it/init_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SetupBinds.setupBindsAuth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.kPrimary),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
