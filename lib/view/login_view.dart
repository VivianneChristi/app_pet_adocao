import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Chave do formulário
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bem-vindo de volta!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login realizado com sucesso!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // Adicione aqui a navegação para a tela inicial, após o login bem-sucedido
                      // Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navegar para a tela de cadastro
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: Text('Não tem conta? Cadastre-se'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
