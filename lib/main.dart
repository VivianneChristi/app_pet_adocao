import 'package:flutter/material.dart';
import 'view/login_view.dart'; // Importar sua página de login
import 'view/cadastro_view.dart'; // Importar sua página de cadastro
import 'view/home_view.dart'; // Importar sua página inicial

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption',
      initialRoute: '/home', // Alterando a rota inicial para a página inicial
      routes: {
        '/home': (context) => HomeView(), // Rota da página principal
        '/cadastro_view': (context) =>
            CadastroView(), // Rota da página de cadastro
        '/login_view': (context) => LoginView(), // Rota da página de login
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) =>
                HomeView()); // Página padrão se a rota não for encontrada
      },
    );
  }
}
