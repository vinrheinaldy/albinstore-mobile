import 'package:albinstore/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:albinstore/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Albin Store',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
            ).copyWith(
              primary: const Color(0xFF4C51BF),
              secondary: const Color(0xFF4C51BF),
            ),
          ),
          home: const LoginPage(),
        ));
  }
}
