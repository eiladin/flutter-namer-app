import 'package:flutter/material.dart';
import 'package:namer_app/models/terms.dart';
import 'package:namer_app/screens/navigator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => TermsModel()),
        ChangeNotifierProvider(create: (context) => TermsModel()),
      ],
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: NavigatorPage(),
      ),
    );
  }
}
