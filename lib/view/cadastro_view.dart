import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/custom_text_field.dart';

class CadastroView extends StatelessWidget {
  final _formKey =
      GlobalKey<FormState>(); // Adicionando uma chave para o formulário
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Usando a chave para o formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crie sua conta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomTextField(
                label: 'Nome',
                controller: _nameController, // Passando o controlador
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'E-mail',
                controller: _emailController, // Passando o controlador
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Senha',
                obscureText: true,
                controller: _passwordController, // Passando o controlador
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Se o formulário for válido, mostre um SnackBar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Cadastro realizado com sucesso!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // Aqui você pode adicionar a lógica para salvar os dados
                      // E redirecionar para outra tela, se necessário
                    }
                  },
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
