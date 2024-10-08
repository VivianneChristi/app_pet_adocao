import 'package:flutter/material.dart';
import 'view/tela_de_entrada_view.dart';
import 'view/login_view.dart';
import 'view/cadastro_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adopt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaDeEntradaView(),
        '/login': (context) => const LoginView(),
        '/cadastro': (context) => const CadastroView(),
      },
    );
  }
}
