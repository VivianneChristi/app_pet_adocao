import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: 'E-mail',
              controller: _emailController,
            ),
            SizedBox(height: 16),
            CustomTextField(
              label: 'Senha',
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar sua lógica de autenticação
                // Para fins de demonstração, vamos apenas navegar para a página inicial
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navegar para a página de cadastro
                Navigator.pushNamed(context, '/cadastro_view');
              },
              child: Text('Não tem uma conta? Cadastre-se aqui.'),
            ),
          ],
        ),
      ),
    );
  }
}
