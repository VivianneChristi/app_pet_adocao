import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'view/cadastro_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adopt',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/login', // Tela inicial será a de login
      routes: {
        '/login': (context) => LoginView(),
        '/cadastro': (context) => CadastroView(),
      },
    );
  }
}
