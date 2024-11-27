import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_adoption/view/home_view.dart';

class CadastroView extends StatelessWidget {
  const CadastroView({Key? key}) : super(key: key);

  Future<void> _cadastro(BuildContext context, String nome, String email,
      String senha, String confirmaSenha, String telefone) async {
    final url =
        Uri.parse('https://pet-adopt-dq32j.ondigitalocean.app/user/register');

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'name': nome,
          'email': email,
          'password': senha,
          'confirmpassword': confirmaSenha, // Confirmar senha
          'phone': telefone, // Telefone
        }),
        headers: {'Content-Type': 'application/json'},
      );

      // Exibe os logs para depuração
      print('URL: $url');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Conta Criada'),
              content: const Text('Sua conta foi criada com sucesso!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Fecha o diálogo
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    ); // Navega para a página inicial
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        final error =
            jsonDecode(response.body)['message'] ?? 'Erro desconhecido';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $error')),
        );
      }
    } catch (e) {
      print('Erro de conexão: $e'); // Log do erro de conexão
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao conectar à API')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();
    TextEditingController confirmaSenhaController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(
                'assets/images/cat.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Criar Conta',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF321BA4),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: telefoneController,
                    decoration: InputDecoration(
                      hintText: 'Telefone',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: confirmaSenhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirme sua Senha',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final nome = nomeController.text.trim();
                      final email = emailController.text.trim();
                      final senha = senhaController.text.trim();
                      final confirmaSenha = confirmaSenhaController.text.trim();
                      final telefone = telefoneController.text.trim();

                      if (nome.isEmpty ||
                          email.isEmpty ||
                          senha.isEmpty ||
                          telefone.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Preencha todos os campos!')),
                        );
                        return;
                      }

                      if (senha != confirmaSenha) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('As senhas não coincidem!')),
                        );
                        return;
                      }

                      _cadastro(
                          context, nome, email, senha, confirmaSenha, telefone);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF321BA4),
                      fixedSize: const Size(328, 48),
                    ),
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Você já tem uma conta? Conecte-se',
                      style: TextStyle(color: Color(0xFF321BA4)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/splash_pink.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
