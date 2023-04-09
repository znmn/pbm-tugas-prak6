import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 2 PBM',
      theme: ThemeData(brightness: Brightness.light),
      initialRoute: Routes.register,
      routes: Routes.mapping,
    );
  }
}
