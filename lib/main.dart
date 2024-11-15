import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/screen/movie_grid_screen.dart';
import 'package:movie_app/screen/splash_scrren.dart';

void main() {
  runApp(ProviderScope(child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScreen(),
        '/home':(context) => MovieGridScreen(),
      },
     // home: MovieGridScreen(),
    );
  }
}

