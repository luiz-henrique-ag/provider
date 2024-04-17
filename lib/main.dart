import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/pages/home.dart';
import 'package:provider_test/pages/step_one.dart';
import 'package:provider_test/pages/step_two.dart';
import 'package:provider_test/providers/person_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PersonProvider()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context) => const HomePage(),
          '/step_one' : (context) => const StepOne(),
          '/step_two' : (context) => const StepTwo()
        },
      ),
    );
  }
}
