import 'package:flutter/material.dart';
import 'package:mini_project/pages/home_page.dart';
import 'package:mini_project/provider/form_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FormProvider>(
          create: (_) => FormProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project',
      home: HomePage(),
    );
  }
}
