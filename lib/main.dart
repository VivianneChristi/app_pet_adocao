import 'package:flutter/material.dart';
import 'view/cadastro_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CadastroView(), // Tela de Cadastro
    );
  }
}
